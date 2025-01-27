import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redi_stories/utils/constants.dart';

class ApiServices {
  static Future<String> generateStory() async {
    final response = await http.post(
        Uri.parse('${GeminiConstants.apiUrl}?key=${GeminiConstants.apiKey}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': 'Write a story on anything'}
              ]
            }
          ]
        }));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception('Failed to generate story');
    }
  }
}
