import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeDisplay extends StatelessWidget {
  // Hardcoded code snippet
  final String code = '''
void main() {
  print("Hello, CodersHub!");
}
print("Yippy!");
  ''';

  // Keywords and their corresponding colors
  final Map<String, Color> syntaxColors = {
    'void': Colors.blueAccent,
    'main': Colors.deepPurpleAccent,
    'print': Colors.orangeAccent,
  };

  CodeDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lines = code.split('\n'); // Split code into lines
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes and padding based on screen width
    double fontSize = screenWidth < 400 ? 12 : screenWidth < 600 ? 14 : 16;
    double lineNumberWidth = screenWidth < 400 ? 24 : 35;
    double lineSpacing = screenWidth < 400 ? 16 : 26;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines.asMap().entries.map((entry) {
          int index = entry.key;
          String line = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Line number with responsive width
                SizedBox(
                  width: lineNumberWidth,
                  child: Text(
                    '${index + 1}',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.firaMono(
                      color: Colors.grey[600],
                      fontSize: fontSize,
                    ),
                  ),
                ),
                SizedBox(width: lineSpacing), // Responsive spacing
                // Code line with syntax highlighting
                Expanded(child: _buildHighlightedLine(line, fontSize)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Method to build a line with syntax highlighting using regex
  Widget _buildHighlightedLine(String line, double fontSize) {
    final words = RegExp(r'(\b\w+\b|\s+|[^\w\s]+)').allMatches(line);

    return RichText(
      text: TextSpan(
        children: words.map((match) {
          final word = match.group(0)!;
          final color = syntaxColors[word] ?? Colors.greenAccent[200];

          return TextSpan(
            text: word,
            style: GoogleFonts.firaMono(
              color: color,
              fontSize: fontSize,
              height: 1.4,
            ),
          );
        }).toList(),
      ),
    );
  }
}