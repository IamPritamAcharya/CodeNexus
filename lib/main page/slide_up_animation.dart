// slide_up_animation.dart

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SlideUpAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const SlideUpAnimation({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    Key? key,
  }) : super(key: key);

  @override
  _SlideUpAnimationState createState() => _SlideUpAnimationState();
}

class _SlideUpAnimationState extends State<SlideUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _hasAnimated = false; // Ensure animation runs only once

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2), // Start slightly below
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.5 && !_hasAnimated) {
      // Start the animation when at least 50% of the widget is visible
      setState(() {
        _hasAnimated = true;
      });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('slide_up_animation_${widget.key}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slideAnimation,
        child: AnimatedOpacity(
          opacity: _hasAnimated ? 1.0 : 0.0,
          duration: widget.duration,
          child: widget.child,
        ),
      ),
    );
  }
}
