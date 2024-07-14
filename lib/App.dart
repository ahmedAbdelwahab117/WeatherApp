import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/screens/Home_Screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
