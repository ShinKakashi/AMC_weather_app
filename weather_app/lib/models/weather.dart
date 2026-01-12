class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String description;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.humidity,
    required this.windSpeed,
});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityName: json['name'] ?? 'Unknown',
      temperature: (json['main']['temp'] ?? 0).toDouble(),
      condition: json['weather'][0]['main'] ?? 'Unknown',
      description: json['weather'][0]['main'] ?? 'Unknown',
      humidity: json['main']['humidity'] ?? 0,
      windSpeed: (json['wind']['speed'] ?? 0).toDouble(),
    );
  }
}
