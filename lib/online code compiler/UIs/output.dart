import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutputDisplay extends StatelessWidget {
  final String output;

  const OutputDisplay({super.key, required this.output});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 42, 54), // Dark grey background color
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Darker shadow for contrast
            blurRadius: 8,
            offset: const Offset(0, 4), // Slightly offset shadow for depth
          ),
        ],
      ),
      child: Text(
        output,
        style: GoogleFonts.robotoMono(
          fontSize: 16.0,
          color: Colors.white, // White text for better contrast on dark background
        ),
      ),
    );
  }
}
