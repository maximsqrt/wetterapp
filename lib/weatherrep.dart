import 'package:flutter/material.dart';
import 'package:wetter/data.dart';

class WeatherRepository {
  WeatherData _weatherData;
  
  //Konstruktor um das Wetter zu initialisieren: 
  WeatherRepository({
    String city = 'DefaultCity',
    double temperature = 0.0,
    WeatherCondition weatherCondition = WeatherCondition.sunny,
  }) : _weatherData = WeatherData(
          city: city,
          temperature: temperature,
          weatherCondition: weatherCondition,
        );
  
  
  
  
  
   // Methode zum Abrufen des Wetters.
  WeatherData getWeather() {
    // Gibt das private Wetter-Attribut zurück.
  
  return _weatherData;
}
}