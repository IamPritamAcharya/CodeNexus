import 'package:comp/main%20page/main_page.dart';
import 'package:comp/sign%20in/login_page.dart';
import 'package:comp/sign%20in/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp/main%20page/hero/themecolors.dart';

import '../../cache_manager.dart';


class SignInButton extends StatefulWidget {
  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool _isHovered = false;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final user = await CacheManager.getUserCache();
    setState(() {
      _isLoggedIn = user != null; // Set to true if user data exists
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (_isLoggedIn) {
            // Navigate to profile or user info page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserInfoPage()), // Replace with User Profile page if available
            );
          } else {
            // Navigate to SignInPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: NavColors.limeBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: NavColors.limeAccent,
              width: 1.5,
            ),
          ),
          child: _isLoggedIn
              ? Icon(
                  Icons.person,
                  color: NavColors.limeText,
                  size: _isHovered ? 23 : 24, // Slightly larger on hover
                )
              : AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 150),
                  style: GoogleFonts.poppins(
                    color: NavColors.limeText,
                    fontSize: _isHovered ? 13 : 14, // Increase font size on hover
                    fontWeight: FontWeight.w500,
                  ),
                  child: Text('Sign-In'),
                ),
        ),
      ),
    );
  }
}
