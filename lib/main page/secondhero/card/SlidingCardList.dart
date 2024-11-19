import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'default_card.dart';

class SmoothEdgeScrollPhysics extends ClampingScrollPhysics {
  final double edgeResistanceFactor;

  const SmoothEdgeScrollPhysics({ScrollPhysics? parent, this.edgeResistanceFactor = 0.1})
      : super(parent: parent);

  @override
  SmoothEdgeScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SmoothEdgeScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels && position.pixels <= position.minScrollExtent) {
      return (value - position.pixels) * edgeResistanceFactor;
    } else if (value > position.pixels && position.pixels >= position.maxScrollExtent) {
      return (value - position.pixels) * edgeResistanceFactor;
    }
    return 0.0;
  }
}

class SlidingCardList extends StatefulWidget {
  const SlidingCardList({super.key});

  @override
  _SlidingCardListState createState() => _SlidingCardListState();
}

class _SlidingCardListState extends State<SlidingCardList> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollBy(-300);
  }

  void _scrollRight() {
    _scrollBy(300);
  }

  void _scrollBy(double offset) {
    final newPosition = (_scrollController.offset + offset).clamp(
      _scrollController.position.minScrollExtent,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.animateTo(
      newPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Center(
      child: SizedBox(
        height: 420,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLargeScreen) ...[
              _buildScrollButton(Icons.arrow_left, _scrollLeft),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: ListView.builder(
                key: const PageStorageKey<String>('sliding_card_list'), 
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const SmoothEdgeScrollPhysics(edgeResistanceFactor: 0.15),
                itemCount: 10,
                itemBuilder: (context, index) => _buildCard(index),
              ),
            ),
            if (isLargeScreen) ...[
              const SizedBox(width: 30),
              _buildScrollButton(Icons.arrow_right, _scrollRight),
              
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildScrollButton(IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        hoverColor: Colors.black26,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        onEnter: (_) => _onHover(index, true),
        onExit: (_) => _onHover(index, false),
        child: _getCardForIndex(index),
      ),
    );
  }

  Widget _getCardForIndex(int index) {
   
    switch (index) {
      case 0:
        return Card1();
      case 1:
        return Card2();
      default:
        return DefaultCard(index: index + 1);
    }
  }

  void _onHover(int index, bool isHovering) {
    
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
