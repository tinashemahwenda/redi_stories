import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redi_stories/utils/constants.dart';

class ApiServices {
  static Future<String> generateStory() async {
    final response = await http.post(Uri.parse(DeepSeekConstants.apiUrl),
        headers: {
          'Authorization': 'Bearer ${DeepSeekConstants.apiKey}',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'prompt': 'Write a story based on an African forest',
          'max-tokens': 200,
        }));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to generate story');
    }
  }
}
