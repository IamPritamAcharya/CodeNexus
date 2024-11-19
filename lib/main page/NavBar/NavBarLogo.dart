import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp/main%20page/hero/themecolors.dart';

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Code',
            style: GoogleFonts.poppins(
              color: NavColors.navTextColor, // Primary color for "Code"
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Nexus',
            style: GoogleFonts.poppins(
              color: NavColors.navTextColor2, // Primary color for "Code"
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
