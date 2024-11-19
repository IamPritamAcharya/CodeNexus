import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main page/AuroraBackground.dart';
import 'UIs/TextSizeSlider.dart';
import 'UIs/output.dart';
import 'UIs/run.dart';
import 'api_service.dart';
import 'code_editor.dart';
import 'constants.dart';
import 'language_map.dart';
import 'language_selector.dart';

class CodeExecutionScreen extends StatefulWidget {
  const CodeExecutionScreen({super.key});

  @override
  _CodeExecutionScreenState createState() => _CodeExecutionScreenState();
}

class _CodeExecutionScreenState extends State<CodeExecutionScreen> {
  String _selectedLanguage = 'python';
  String _output = '';
  double _textSize = 14.0; // Text size for code editor
  late CodeController _codeController;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _initializeCodeController();
  }

  void _initializeCodeController() {
    _codeController = CodeController(
      text: CODE_SNIPPETS[_selectedLanguage] ?? '',
      language: getHighlightLanguage(_selectedLanguage),
    );
  }

  void _onLanguageSelected(String language) {
    setState(() {
      _selectedLanguage = language;
      _initializeCodeController();
    });
  }

  Future<void> _onRunPressed() async {
    setState(() {
      _isRunning = true;
      _output = 'Executing code...';
    });

    final result = await ApiService.executeCode(
      _selectedLanguage,
      _codeController.text,
    );

    setState(() {
      _output = result;
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // For Android/smaller screens

    return Scaffold(
      body: Stack(
        children: [
          // Aurora Background
          AuroraBackground(),

          // Main content layer
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Conditional Back Button (only on larger screens)
                        if (!isSmallScreen)
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 16.0, right: 16, bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Navigate back when pressed
                                },
                              ),
                            ),
                          ),
                        Expanded(
                          child: LanguageSelector(
                            selectedLanguage: _selectedLanguage,
                            onLanguageSelected: _onLanguageSelected,
                          ),
                        ),
                        
                        // Include TextSizeSlider
                        if (!isSmallScreen)
                          Row(
                            children: [
                              TextSizeSlider(
                                textSize: _textSize,
                                onTextSizeChanged: (value) {
                                  setState(() {
                                    _textSize = value;
                                  });
                                },
                              ),
                              // Add space between slider and run button
                              SizedBox(width: 16.0), // Adjust width as needed
                            ],
                          ),
                        
                        // Run button
                        Align(
                          alignment: Alignment.centerRight,
                          child: RunButton(
                            onPressed: _onRunPressed,
                            isLoading: _isRunning,
                          ),
                        ),
                      ],
                    ),

                    // Display TextSizeSlider in a new row for smaller screens
                    if (isSmallScreen)
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextSizeSlider(
                          textSize: _textSize,
                          onTextSizeChanged: (value) {
                            setState(() {
                              _textSize = value;
                            });
                          },
                          isSmallScreen: true,
                        ),
                      ),
                  ],
                ),
              ),

              // Code Editor Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 40, 42, 54),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12.0),
                      child: CodeEditorWidget(
                        controller: _codeController,
                        textSize: _textSize, // Pass text size to editor
                      ),
                    ),
                  ),
                ),
              ),

              // Output Display Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutputDisplay(output: _output),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
