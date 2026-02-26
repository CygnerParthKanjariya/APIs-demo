import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load post,${response.statusCode}");
    }
  }
}
