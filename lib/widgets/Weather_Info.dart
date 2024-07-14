import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/utils/app_color.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weather = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.cityName,
              style: TextStyle(
                  fontSize: 30,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Updated at : ${weather.date.hour}:${weather.date.minute}',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network('https:${weather.image}'),
                Text(
                  weather.temp.round().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Column(
                  children: [
                    Text(
                      'maxTemp : ${weather.maxTemp.round()}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      'minTemp : ${weather.minTemp.round()}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            Text(
              weather.state,
              style: TextStyle(
                  fontSize: 30,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
