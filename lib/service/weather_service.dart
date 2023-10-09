import 'package:counter_app/model/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class WeatherService {
  final Dio dio = Dio();

  Future<String?> getCity() async {
    try {
      final res = await dio.get('http://ip-api.com/json');
      debugPrint('get city status code ${res.statusCode}');
      if (res.statusCode == 200 || res.statusCode == 201) {
        debugPrint('get city result ${res.data}');
        return res.data['city'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('something went wrong on get city $e');
      return null;
    }
  }

  Future<WeatherModel?> getWeather(String city) async {
    try {
      final res = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=4ad1b66c0dfc414f9ab100129230910&q=$city&aqi=no',
      );
      debugPrint('weather service status code ${res.statusCode}');
      if (res.statusCode == 200 || res.statusCode == 201) {
        debugPrint('weather service get weather ${res.data}');
        return WeatherModel.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('something went wrong on get weather api $e');
      return null;
    }
  }
}
