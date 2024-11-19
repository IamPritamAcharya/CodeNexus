import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/dracula.dart'; // Using a modern coding theme
import 'package:google_fonts/google_fonts.dart';

class CodeEditorWidget extends StatelessWidget {
  final CodeController controller;
  final double textSize;

  const CodeEditorWidget({
    super.key,
    required this.controller,
    this.textSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(styles: draculaTheme),
      child: CodeField(
        controller: controller,
        textStyle: GoogleFonts.robotoMono(
          fontSize: textSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
