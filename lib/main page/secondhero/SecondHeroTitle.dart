import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondHeroTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size for responsiveness
    double fontSize = screenWidth < 400 ? 28 : screenWidth < 600 ? 25 : 36;
    double leftPadding = screenWidth < 600 ? 50.0 : 100.0;

    return Align(
      alignment: Alignment.centerLeft, // Align to the left
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding, right: 50), // Add spacing from the left side
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              // "Everything" with gradient, adjust baseline
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                      Colors.pinkAccent, 
                      Colors.purple,
                      Colors.purple,
                      Colors.teal
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Everything ',
                    style: GoogleFonts.poppins(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // color ignored due to ShaderMask
                    ),
                  ),
                ),
              ),
              // "you need" in white
              TextSpan(
                text: 'you need',
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
