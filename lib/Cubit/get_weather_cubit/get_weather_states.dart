import 'package:weather/services/Weather_Model.dart';

class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
