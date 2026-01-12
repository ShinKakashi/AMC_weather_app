import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather.fromJson', () {
    test('should correctly parse a JSON response from OpenWeatherMap API', () {
      // A realistic sample JSON response for Manila from OpenWeatherMap API
      final jsonString = '''
      {
        "coord": { "lon": 120.9845, "lat": 14.5995 },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "main": {
          "temp": 29.94,
          "feels_like": 36.94,
          "temp_min": 28.82,
          "temp_max": 30.48,
          "pressure": 1008,
          "humidity": 82
        },
        "wind": {
          "speed": 4.63,
          "deg": 220
        },
        "name": "Manila",
        "dt": 1721364585
      }
      ''';

      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      // Act
      final weather = Weather.fromJson(jsonMap);

      // Assert
      // We use closeTo for doubles to avoid floating point precision issues in tests
      expect(weather.cityName, 'Manila');
      expect(weather.temperature, 29.94);
      expect(weather.condition, 'Clouds');
      expect(weather.description, 'broken clouds');
      expect(weather.humidity, 82);
      expect(weather.windSpeed, 4.63);
    });
  });
}
