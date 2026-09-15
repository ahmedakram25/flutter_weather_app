import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    super.city,
    super.temp,
    super.weatherCondition
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