// code_snippet.dart

import 'package:flutter/material.dart';
import 'code_display.dart'; // Import the new CodeDisplay widget

class CodeSnippet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width < 1200 ? MediaQuery.of(context).size.width * 0.9 : 1200,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          gradient: LinearGradient(
            colors: [Colors.grey[900]!.withOpacity(0.3), Colors.grey[800]!.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCircle(Colors.red),
                    SizedBox(width: 6),
                    _buildCircle(Colors.orange),
                    SizedBox(width: 6),
                    _buildCircle(Colors.green),
                  ],
                ),
              ),
              Divider(color: Colors.grey[700], height: 1, thickness: 1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CodeDisplay(), // No code passed, it’s hardcoded in CodeDisplay
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
