import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureDescription extends StatelessWidget {
  final String description;

  const FeatureDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 600 ? 14.0 : 16.0; // Adjust font size based on screen width

    return Text(
      description,
      style: GoogleFonts.lato( // Using Lato as a modern font; you can replace with others like Roboto or Poppins
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w300, // Bold for emphasis
      ),
    );
  }
}
