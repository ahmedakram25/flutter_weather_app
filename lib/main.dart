import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/Mangers/weather_notifier.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherNotifier(),
      child: const MyApp()
      )
    );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}