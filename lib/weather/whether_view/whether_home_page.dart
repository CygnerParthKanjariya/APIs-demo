import 'package:flutter/material.dart';

import '../whether_models/whether_model.dart';
import '../whether_services/whether_get_service.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _weatherHomePageState();
}

class _weatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("weather"), centerTitle: true),
      body: FutureBuilder<WeatherModel>(
        future: WeatherGetService().getweather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("No Data"));
          } else {
            final weatherData = snapshot.data!;
            return ListView(
              children: [
                ListTile(
                  title: Text("City : ${weatherData.name}"),
                  subtitle: Text("Visibility : ${weatherData.visibility}"),
                ),
                ListTile(
                  title: Text("weather : ${weatherData.weather?[0].main}"),
                  subtitle: Text("Wind : ${weatherData.wind?.speed}"),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
