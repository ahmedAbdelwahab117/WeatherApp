import 'dart:developer';

import 'package:weather/services/Weather_Model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'baa41636723d4abb973190410241005';
  Dio dio = Dio();
  Future<WeatherModel> weatherService({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMsg =
          e.response?.data['error']['message'] ?? 'OPPS , there was an error';
      throw Exception(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('OPPS , there was an error');
    }
  }
}
