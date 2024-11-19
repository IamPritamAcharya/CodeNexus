import 'package:highlight/highlight.dart';
import 'package:highlight/languages/java.dart' as java;
import 'package:highlight/languages/python.dart' as python;
import 'package:highlight/languages/javascript.dart' as javascript;
import 'package:highlight/languages/cpp.dart' as cpp;
import 'package:highlight/languages/cs.dart' as csharp;

Mode getHighlightLanguage(String language) {
  switch (language) {
    case 'java':
      return java.java;
    case 'python':
      return python.python;
    case 'javascript':
      return javascript.javascript;
    case 'c++':
      return cpp.cpp;
    case 'csharp':
      return csharp.cs;
    default:
      return python.python; // Fallback language
  }
}
