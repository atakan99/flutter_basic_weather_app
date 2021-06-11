import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_basic_weather_app/src/models/models.dart';

class DataService {

  Future<WeatherResponse> getWeather( String city) async{
/// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParams = {
      'q':city, 
      'appid':'8736dc7d077459b0cd07547cce932293',
      'units': 'metric',};

    final uri = 
    Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

}

