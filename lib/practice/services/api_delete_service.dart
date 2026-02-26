import 'package:http/http.dart' as http;

class ApiDeleteService {
  static Future<void> deleteDate() async {
    final response = await http.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      print("Data Deleted with status code ${response.statusCode}");
      print(response.body);
    } else if (response.statusCode == 204) {
      print("No Content");
    } else {
      print("Error");
    }
  }
}
