import 'package:flutter/material.dart';
import 'package:wetter/data.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Beispielobjekt der Klasse WeatherData erstellen
    WeatherData exampleWeatherData = WeatherData(
      city: 'Freiburg',
      temperature: 20.0,
      weatherCondition: WeatherCondition.sunny,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Wetter',
            style: TextStyle(
              color: Color.fromARGB(255, 20, 189, 65),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: WeatherApp(weatherData: exampleWeatherData), // WeatherData an WeatherApp übergeben
      ),
    );
  }
}

class WeatherApp extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherApp({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stadt: ${weatherData.city}',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40.0,
              ),
            ),
            Text(
              'Temperatur: ${weatherData.temperature}°C',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
              ),
            ),
            Text(
              'Wetter: ${_getWeatherConditionString(weatherData.weatherCondition)}',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  String _getWeatherConditionString(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.sunny:
        return 'Sonnig';
      case WeatherCondition.cloudy:
        return 'Bewölkt';
      case WeatherCondition.rainy:
        return 'Regnerisch';
      case WeatherCondition.stormy:
        return 'Stürmisch';
      default:
        return 'Unbekannt';
    }
  }
