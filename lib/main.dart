import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newMethod(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //  GestureDetector newMethod(BuildContext context) {
            // return GestureDetector(
            // onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>WeatherDetailpage()));
            // },
            const Text(
              "26°C",
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Mostly Clear",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _weatherInfoTile(Icons.thermostat, "720hpa"),
                _weatherInfoTile(Icons.water_drop, "32%"),
                _weatherInfoTile(Icons.air, "12km/h"),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[50],
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Temperature",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                    // child: const Text(
                           
                    //   "Temperature",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    // ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _temperatureTile("Morning", "26°"),
                      _temperatureTile("Afternoon", "24°"),
                      _temperatureTile("Evening", "28°"),
                      _temperatureTile("Night", "20°"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Today",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,

                children: [
                  _hourlyForecastTile("01 PM", "25°", Icons.wb_sunny),
                  _hourlyForecastTile("02 PM", "26°", Icons.wb_sunny),
                  _hourlyForecastTile("03 PM", "27°", Icons.wb_sunny),
                  _hourlyForecastTile("04 PM", "23°", Icons.wb_cloudy),
                  _hourlyForecastTile("05 PM", "20°", Icons.wb_cloudy),
                  _hourlyForecastTile("06 PM", "20°", Icons.wb_cloudy),
                  _hourlyForecastTile("07 PM", "20°", Icons.water_drop),
                  _hourlyForecastTile("08 PM", "20°", Icons.thermostat),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar newMethod() {
    return AppBar(
      backgroundColor: Colors.yellow,
      leading: const Icon(Icons.location_on),
      title:
          const Text("Budanilkantha ", style: TextStyle(color: Colors.black)),
      // centerTitle: true,
      // spacer()
      //  title: TimeOfDay(hour: hour, minute: minute),
    );
  }

  Widget _weatherInfoTile(IconData icon, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _temperatureTile(String timeOfDay, String temperature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(timeOfDay, style: const TextStyle(fontSize: 16)),
          Text(temperature, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _hourlyForecastTile(String time, String temperature, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[50],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time),
          Icon(icon, color: Colors.blue),
          Text(temperature),
        ],
      ),
    );
  }

  spacer() {}
}
