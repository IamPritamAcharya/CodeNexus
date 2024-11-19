import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const FeatureButton({
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
      buttonText,
      style: GoogleFonts.lato( // Using Lato as a modern font; you can replace with others like Roboto or Poppins
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w700, // Bold for emphasis
      ),
    ),
    );
  }
}
