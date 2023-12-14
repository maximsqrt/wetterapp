import 'package:flutter/material.dart';
import 'package:wetter/data.dart';
import 'package:wetter/weatherrep.dart';
void main() {
  // Erstelle ein WeatherRepository-Objekt
  WeatherRepository weatherRepository = WeatherRepository();

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  // Das WeatherRepository-Objekt wird als Attribut der Klasse deklariert.
  final WeatherRepository weatherRepository;
 // Konstruktor für MyApp, der ein erforderliches WeatherRepository-Objekt annimmt.
  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        // Verwende das Wetter aus dem WeatherRepository
        body: WeatherApp(weatherRepository: weatherRepository),
      ),
    );
  }
}

class WeatherApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const WeatherApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Holen Sie das Wetter aus dem WeatherRepository
    WeatherData weatherData = weatherRepository.getWeather();

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
