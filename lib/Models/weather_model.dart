import 'package:flutter/foundation.dart';

class WeatherModel {
  String? city, weatherCondition;
  double? temp;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final weather = WeatherModel(
      city: json['location']['name']?.toString(),
      temp: (json['current']['temp_c'] as num?)?.toDouble(),
      weatherCondition: json['current']['condition']['text']?.toString(),
    );

    debugPrint("weather condition: ${weather.weatherCondition}, temp: ${weather.temp}, city: ${weather.city}");
    

    return weather;
  }
}