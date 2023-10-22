import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:questions/Models/Api_Models/Question.dart';

class ApiService {
  static const String baseUrl = 'https://api.stackexchange.com/2.3';

  Future<List<QuestionItem>> getItems() async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/questions?order=desc&sort=activity&site=stackoverflow'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<QuestionItem> items = List<QuestionItem>.from(
          data['items'].map((item) => QuestionItem.fromJson(item)));
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }
}
