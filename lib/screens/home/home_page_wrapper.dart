import 'package:counter_app/app_bloc/counter/counter_cubit.dart';
import 'package:counter_app/app_bloc/theme/theme_cubit.dart';
import 'package:counter_app/app_bloc/weather/weather_cubit.dart';
import 'package:counter_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(cubit),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => WeatherCubit(),
        )
      ],
      child: const HomePage(),
    );
  }
}
