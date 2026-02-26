import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiPutService {
  static Future<void> putData() async {
    final response = await http.put(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"userId": 1, "title": "foo", "body": "bar"}),
    );
    if (response.statusCode == 200) {
      print(
        "Data Updated Successfully with status code ${response.statusCode}",
      );
      print(response.body);
    } else if (response.statusCode == 204) {
      print("No Content Found with status code ${response.statusCode}");
    } else {
      print("Error");
    }
  }
}
