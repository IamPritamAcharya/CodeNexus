// File: hero/second_hero_subtitle.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondHeroSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size for responsiveness
    double fontSize = screenWidth < 400 ? 14 : screenWidth < 600 ? 16 : 18;

    // Set padding based on screen width
    double leftPadding = screenWidth < 600 ? 50.0 : 100.0;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: 50), // Responsive padding
      child: Text(
        'All in one spot - Code HS is trusted by thousands of teachers all across the world',
        style: GoogleFonts.nunito(
          color: Colors.white70,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
