import 'package:flutter/material.dart';
import '../../Models/weather_model.dart';
import '../../Services/weatherService.dart';

class WeatherNotifier extends ChangeNotifier {
  WeatherModel? weatherModel;

  Future<void> featchWeather({required String city}) async {
    weatherModel = await Weatherservice().getWeather(city: city);
    notifyListeners();
  }
}