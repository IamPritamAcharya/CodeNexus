import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themecolors.dart';

class CenterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    double titleFontSize = screenWidth * 0.03; 
    double mainTextFontSize = screenWidth * 0.1; 
    double mainTextFontSizeMin = 35; 

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Unlock exclusive resources and compete with fellow IGIT students!',
                style: GoogleFonts.poppins(
                  color: CenterTextColors.subtitleColor,
                  fontSize: titleFontSize.clamp(12, 18), 
                ),
              ),
              SizedBox(height: 8), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    'Code Here. ',
                    style: GoogleFonts.poppins(
                      color: CenterTextColors.primaryTextColor,
                      fontSize: mainTextFontSize.clamp(mainTextFontSizeMin, 65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
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
                        color: Colors.white, 
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
