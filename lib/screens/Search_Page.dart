import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/services/Weather_Model.dart';
import 'package:weather/utils/app_color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textFiled,
        title: Text(
          'Search a City',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var weatherCubit = BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIconColor: AppColors.black,
              hintText: 'Enter City Name',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              suffixIcon: const Icon(
                Icons.search,
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
