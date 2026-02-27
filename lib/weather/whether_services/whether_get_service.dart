import 'dart:convert';

import 'package:api_demo/weather/whether_view/weather_home_page.dart';
import 'package:http/http.dart' as http;

import '../whether_models/whether_model.dart';

class WeatherGetService {
  String location = locationController.text;
  Future<WeatherModel> getweather() async {
    final response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=826017599217913b3be75c467daef0e6&units=metric",
      ),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(response.body);
      return WeatherModel.fromJson(data);
    } else {
      print("Error");
      throw Exception("Failed to load post,${response.statusCode}");
    }
  }
}
