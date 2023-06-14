import 'package:flutter_training/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
// http://api.openweathermap.org/data/2.5/weather?q=Toulouse&appid=3d37a4ab681b984c85575c6fa1364b8a
  final String authority =
      "api.openweathermap.org";
  final String path = 
      "data/2.5/weather";
  final String apiKey =
      "3d37a4ab681b984c85575c6fa1364b8a";
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appId': apiKey
    };
    Uri uri =
        Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data =
        json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
