import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/features/weather/presentation/manager/weather_notifier.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String cityName = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          "Search on any Country/Capital",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<WeatherNotifier>(
              builder: (context, weatherNotifier, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (data) {
                      cityName = data.trim();
                    },
                    decoration: InputDecoration(
                      suffixIcon: isLoading? const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                       : IconButton(
                        onPressed: isLoading? null:() async {
                            if(cityName.isNotEmpty){
                              if(context.mounted) setState(() => isLoading = true);
                            await weatherNotifier.featchWeather(city: cityName);
                            if (context.mounted) {
                              Navigator.pop(context);
                              isLoading = !isLoading;

                            }
                        
                          }
                        },
                        icon: const Icon(Icons.search, color: Colors.black),
                      
                      ),
                
                      label: const Text("Enter a Country/Capital"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}