import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const RunButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonFontSize = screenWidth < 600 ? 12.0 : 14.0;
    final buttonWidth = screenWidth < 600 ? 120.0 : 140.0;

    return SizedBox(
      width: buttonWidth, // Adjust width based on screen size
      height: 48, // Fixed height for consistent button size
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'Running...',
                    style: GoogleFonts.robotoMono(fontSize: buttonFontSize),
                  ),
                ],
              )
            : Text(
                'Run Code',
                style: GoogleFonts.robotoMono(fontSize: buttonFontSize),
              ),
      ),
    );
  }
}
