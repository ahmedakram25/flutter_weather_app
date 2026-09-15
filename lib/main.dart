import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/weather/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/features/weather/presentation/manager/weather_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
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