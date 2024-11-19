import 'package:comp/pages%20&%20hidden%20drawer/pages.dart';
import 'package:flutter/material.dart';
import 'NavBarLogo.dart';
import 'NavBarButtons.dart';
import 'SignInButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp/main%20page/hero/themecolors.dart';

import 'dart:ui'; // Import this for the ImageFilter class

class CustomTopNavBar extends StatelessWidget {
  final List<AppPage> appPages;

  CustomTopNavBar({required this.appPages});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            NavColors.backgroundGradientStart.withOpacity(0.2),
            NavColors.backgroundGradientEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ClipRect( // Clip the blurred area to avoid overflow
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 10.0), // Adjust sigma values for more or less blur
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavBarLogo(),
                  NavBarButtons(appPages: appPages),
                  SignInButton(),
                ],
              ),
              _BottomSeparator(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 0.5,
      color: NavColors.separatorLine.withOpacity(0.5),
    );
  }
}

