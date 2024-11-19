import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureTitle extends StatelessWidget {
  final String title;

  const FeatureTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 600 ? 20.0 : 28.0; // Adjust font size based on screen width

    return Text(
      title,
      style: GoogleFonts.lato( // Using Lato as a modern font; you can replace with others like Roboto or Poppins
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w700, // Bold for emphasis
      ),
    );
  }
}
