import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constants.dart';

class ApiService {
  static const _baseUrl = 'https://emkc.org/api/v2/piston';

static Future<String> executeCode(String language, String sourceCode) async {
    final url = Uri.parse('$_baseUrl/execute');
    final version = LANGUAGE_VERSIONS[language] ?? 'latest';

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'language': language,
          'version': version,
          'files': [
            {'content': sourceCode}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData.containsKey('run') && responseData['run'].containsKey('output')) {
          return responseData['run']['output'] ?? 'No output';
        } else {
          return 'Unexpected response structure: ${response.body}';
        }
      } else {
        return 'Failed to execute code: ${response.statusCode} - ${response.reasonPhrase}';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
