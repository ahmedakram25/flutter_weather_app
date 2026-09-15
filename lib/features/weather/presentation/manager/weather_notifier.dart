import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/weather/data/data_source/weather_service.dart';
import '../../domain/entities/weather_entity.dart';


class WeatherNotifier extends ChangeNotifier {
  WeatherEntity? weatherModel;

  Future<void> featchWeather({required String city}) async {
    weatherModel = await Weatherservice().getWeather(city: city);
    notifyListeners();
  }
}