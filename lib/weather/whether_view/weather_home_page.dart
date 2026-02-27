import 'package:flutter/material.dart';

import '../whether_models/whether_model.dart';
import '../whether_services/whether_get_service.dart';

TextEditingController locationController = TextEditingController();

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            TextFormField(
              controller: locationController,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                if (locationController.text.trim().isNotEmpty) {
                  WeatherGetService().getweather();
                }
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on_outlined),
                hintText: "Location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return WeatherGetService().getweather().then((value) {
                    setState(() {});
                  });
                },
                child: FutureBuilder<WeatherModel>(
                  future: WeatherGetService().getweather(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Center(child: Text("No Data"));
                    } else {
                      final weatherData = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://openweathermap.org/img/wn/${weatherData.weather?[0].icon}@2x.png',
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.location_on),
                                  Text(
                                    weatherData.name ?? '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: .w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.thermostat, size: 55),
                                Text(
                                  weatherData.main!.temp.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: .w700,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.thermostat,
                                  color: Colors.red,
                                  size: 40,
                                ),
                                Text(
                                  "${weatherData.main!.tempMin.toString()}/${weatherData.main!.tempMax.toString()}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: .w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: .spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                    Text(
                                      "${weatherData.visibility.toString()} M",
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.air,
                                      color: Colors.blueGrey,
                                      size: 40,
                                    ),
                                    Text(
                                      "${weatherData.wind?.speed.toString()} m/s",
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.cloud_queue,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                    Text(
                                      weatherData.clouds?.all.toString() ?? "",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: .spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.speed,
                                      color: Colors.deepPurple,
                                      size: 40,
                                    ),
                                    Text(
                                      "${weatherData.main?.pressure.toString()} hpa",
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.water_drop_outlined,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    Text(
                                      "${weatherData.main?.humidity.toString()}%",
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.water,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                    Text(
                                      weatherData.main?.seaLevel.toString() ??
                                          "",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
