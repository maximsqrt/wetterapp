import 'package:flutter/material.dart';

enum WeatherCondition { sunny, cloudy, rainy, stormy }

class WeatherData extends StatelessWidget {
  final String city ;
  final double temperature ;
  final WeatherCondition weatherCondition;

  // Konstruktor
  const WeatherData({
    Key? key,
    required this.city,
    required this.temperature,
    required this.weatherCondition,
  }) : super(key: key);
  


@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Stadt: $city'),
      Text('Temperatur: $temperature°C'),
      Text('Wetter: $weatherCondition'),
    ],
  );
}
}