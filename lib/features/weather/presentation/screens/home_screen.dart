import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/weather/presentation/manager/weather_notifier.dart';
import 'package:flutter_application_1/features/weather/presentation/screens/search_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen())),
             icon: Icon(Icons.search_rounded, color: Colors.white,)
             )
        ],
      ),
      body: Center(
        child: Consumer<WeatherNotifier>(
          builder: (context, WeatherNotifier, child) {

            return  Column(
              mainAxisAlignment: .center,
              children: [
                WeatherNotifier.weatherModel == null ? 
                Text(
                  "Welcome to our App 😎\nThere is no weather data yet ⚠️",
                  style: TextStyle(fontSize: 20),
                  textAlign: .center,
                ):
                Text(
                  "temp: ${WeatherNotifier.weatherModel!.temp}\ncity: ${WeatherNotifier.weatherModel!.city}\nweatherCondition: ${WeatherNotifier.weatherModel!.weatherCondition}",
             
         
                )
              ],
            );
          }
        ),
      ),
        );
  }
}