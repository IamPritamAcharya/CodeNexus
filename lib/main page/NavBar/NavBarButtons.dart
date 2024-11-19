import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp/pages%20&%20hidden%20drawer/pages.dart';
import 'package:comp/main%20page/hero/themecolors.dart';

class NavBarButtons extends StatelessWidget {
  final List<AppPage> appPages;

  NavBarButtons({required this.appPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: appPages
          .where((page) => page.label != 'Sign-In')
          .map((page) => _NavBarButton(page: page))
          .toList(),
    );
  }
}

class _NavBarButton extends StatefulWidget {
  final AppPage page;

  _NavBarButton({required this.page});

  @override
  __NavBarButtonState createState() => __NavBarButtonState();
}

class __NavBarButtonState extends State<_NavBarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click, // Set cursor to click
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.page.page),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.page.label,
                style: GoogleFonts.poppins(
                  color: _isHovered ? NavColors.navTextColor.withOpacity(0.8) : NavColors.navTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4), // Space between text and dot
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: _isHovered ? 6 : 0, // Show dot on hover
                width: 6,
                decoration: BoxDecoration(
                  color: _isHovered ? NavColors.navTextColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
