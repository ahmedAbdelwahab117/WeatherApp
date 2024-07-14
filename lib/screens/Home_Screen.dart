import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/screens/Search_Page.dart';
import 'package:weather/utils/app_color.dart';
import 'package:weather/widgets/No_Weather.dart';
import 'package:weather/widgets/Weather_Info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.appBar,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ));
              },
              icon: const Icon(Icons.search),
              color: AppColors.white,
            )
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const NoWeather();
            } else if (state is WeatherLoaded) {
              return WeatherInfo();
            } else {
              return const Center(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/4051551_2142357.jpg'),
                ),
              );
            }
          },
        ));
  }
}
