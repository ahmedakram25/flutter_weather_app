import 'dart:convert';

import 'package:flutter/material.dart';

import '../../APIs/weather_api.dart';
import '../Models/weather_model.dart';
import 'package:http/http.dart' as http ;

class Weatherservice {

  Future<WeatherModel> getWeather({required String city})async{
    final url = Uri.parse('https://api.weatherapi.com/v1/current.json?key=${ApiKeys.weatherApiKey}&q=$city&aqi=no');
    final response = await http.get(url);

    // أضف السطرين دول هنا عشان تشوف الرد في الـ Console:
     debugPrint("Status Code: ${response.statusCode}");
     debugPrint("Response Body: ${response.body}");
   
    if(response.statusCode == 200){
       final decodedRespnse = jsonDecode(response.body);
      return WeatherModel.fromJson(decodedRespnse);
    }
    else{
      throw Exception("Falied to load weather data");

    }
  }
}