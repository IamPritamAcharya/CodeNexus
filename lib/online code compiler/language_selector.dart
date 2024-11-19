import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 600 ? 14.0 : 14.0;
    final languages = ['python', 'java', 'c++'];
    final otherLanguages = ['javascript', 'typescript', 'csharp', 'php'];

    return Wrap(
      spacing: 8.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var lang in languages)
          ChoiceChip(
            label: Text(
              lang.toUpperCase(),
              style: GoogleFonts.robotoMono(fontSize: fontSize),
            ),
            selected: selectedLanguage == lang,
            onSelected: (_) => onLanguageSelected(lang),
          ),
        const SizedBox(width: 12.0), // Spacer between c++ and dropdown
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: otherLanguages.contains(selectedLanguage) ? selectedLanguage : null,
            hint: Text(
              'Others',
              style: GoogleFonts.robotoMono(fontSize: fontSize),
            ),
            items: otherLanguages.map((lang) {
              return DropdownMenuItem(
                value: lang,
                child: Text(
                  lang,
                  style: GoogleFonts.robotoMono(fontSize: fontSize),
                ),
              );
            }).toList(),
            onChanged: (newLang) {
              if (newLang != null) {
                onLanguageSelected(newLang);
              }
            },
            style: GoogleFonts.robotoMono(color: Colors.grey),
            dropdownColor: Color.fromARGB(255, 22, 22, 22),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
