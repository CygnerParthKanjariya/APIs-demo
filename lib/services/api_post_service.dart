import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiPostService {
  static Future<bool> createPost() async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "userId": 1,
        "title": "New Post",
        "body": "This is my post",
      }),
    );
    if (response.statusCode == 201) {
      print(
        "New Data created Successfully with status code ${response.statusCode}",
      );
      print(response.body);
    } else {
      print("Failed to create New Data");
    }
    return true;
  }
}
