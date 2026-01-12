
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather Model Test', () {
    test('should parse Manila JSON correctly into Weather object', () {
      // Realistic Manila JSON response from OpenWeatherMap
      final Map<String, dynamic> manilaJson = {
        "name": "Manila",
        "main": {
          "temp": 31.02,
          "humidity": 65,
        },
        "weather": [
          {"description": "broken clouds"}
        ],
        "wind": {
          "speed": 4.12
        }
      };

      // Act
      final weather = Weather.fromJson(manilaJson);

      // Assert - Matching the properties used in your WeatherScreen
      expect(weather.city, 'Manila');
      expect(weather.temperature, 31.02);
      expect(weather.description, 'broken clouds');
      expect(weather.humidity, 65);
      expect(weather.windSpeed, 4.12);
    });

    test('should handle integer values for temperature and wind', () {
      final Map<String, dynamic> intJson = {
        "name": "Manila",
        "main": {"temp": 30, "humidity": 70},
        "weather": [{"description": "clear sky"}],
        "wind": {"speed": 5}
      };

      final weather = Weather.fromJson(intJson);

      // Verification that it converts ints to doubles safely
      expect(weather.temperature, 30.0);
      expect(weather.windSpeed, 5.0);
    });
  });
}