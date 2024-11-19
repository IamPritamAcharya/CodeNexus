import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatefulWidget {
  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(_isHovering ? 1.05 : 1.0),
        width: isMobile ? 160 : 200,
        height: isMobile ? 36 : 40,
        child: ElevatedButton(
          onPressed: () {
            // Define button action here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lime.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            elevation: 5,
          ),
          child: FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  size: isMobile ? 16 : 20,
                  color: Colors.black87,
                ),
                SizedBox(width: 8),
                Text(
                  'Enter the Nexus',
                  style: GoogleFonts.robotoMono(
                    color: Colors.grey[800], 
                    fontSize: 14 , 
                    fontWeight: FontWeight.w500, 
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
