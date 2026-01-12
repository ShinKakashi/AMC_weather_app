import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class WeatherService {
  static const String apiKey = 'a6c2a3585dcfc20398a292cc064761dc';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Weather> getWeather(String cityName) async {
    try {
      // Step 1: Construct the Complete API URL
      final String url = '$baseUrl?q=$cityName&appid=$apiKey&units=metric';

      // Step 2: Make the HTTP request
      // This now works because of 'as http' in the import
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      // Step 3: Check HTTP response Status
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Weather.fromJson(data);
      } else if (response.statusCode == 404) {
        throw Exception('City not found, pls check the spelling');
      } else {
        throw Exception(
            'failed to load Weather, status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }
}