import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiKeys{
  static String weatherApiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
}