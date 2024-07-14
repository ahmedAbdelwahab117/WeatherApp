import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/services/Weather_Model.dart';
import 'package:weather/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().weatherService(cityName: cityName);
      emit(WeatherLoaded(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
