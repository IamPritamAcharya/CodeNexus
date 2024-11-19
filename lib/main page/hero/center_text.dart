import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themecolors.dart';

class CenterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define font sizes that scale with screen width
    double titleFontSize = screenWidth * 0.03; // Roughly 3% of screen width
    double mainTextFontSize = screenWidth * 0.1; // Roughly 10% of screen width
    double mainTextFontSizeMin = 35; // Minimum font size for small screens

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown, // Ensures scaling down if still too large
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Unlock exclusive resources and compete with fellow IGIT students!',
                style: GoogleFonts.poppins(
                  color: CenterTextColors.subtitleColor,
                  fontSize: titleFontSize.clamp(12, 18), // Clamp to reasonable range
                ),
              ),
              SizedBox(height: 8), // Fixed spacing, adjusts with FittedBox if needed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Code Here." text in white
                  Text(
                    'Code Here. ',
                    style: GoogleFonts.poppins(
                      color: CenterTextColors.primaryTextColor,
                      fontSize: mainTextFontSize.clamp(mainTextFontSizeMin, 65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // "Code Now." text with gradient applied via ShaderMask
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: CenterTextColors.gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: Text(
                      'Code Now.',
                      style: GoogleFonts.poppins(
                        fontSize: mainTextFontSize.clamp(mainTextFontSizeMin, 65),
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Base color needed for ShaderMask
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
