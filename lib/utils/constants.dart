import 'package:flutter_config/flutter_config.dart';

class Constants {
  static String apiKey = FlutterConfig.get('WEATHER_KEY');

  static const String baseUrl = 'http://api.openweathermap.org';
}
