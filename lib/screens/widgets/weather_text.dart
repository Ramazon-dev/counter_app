import 'package:counter_app/app_bloc/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherText extends StatelessWidget {
  const WeatherText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const Text(
            'Press the icon to get your location.',
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is WeatherLoaded) {
          final weather = state.weather;
          return Text(
            'Weather for ${weather.location?.country},${weather.location?.name}: ${weather.current?.tempC} (${weather.current?.tempF})',
          );
        } else {
          return const Text(
            'Something Went Wrong',
          );
        }
      },
    );
  }
}
