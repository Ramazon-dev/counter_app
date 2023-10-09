import 'package:counter_app/app_bloc/counter/counter_cubit.dart';
import 'package:counter_app/app_bloc/theme/theme_cubit.dart';
import 'package:counter_app/app_bloc/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<WeatherCubit>().getWeather();
                },
                child: const Icon(Icons.cloud),
              ),
              if (state != 10)
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().add();
                  },
                  child: const Icon(Icons.add),
                )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<ThemeCubit>().onStateChanged();
                },
                child: const Icon(Icons.color_lens),
              ),
              if (state != 0)
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().subtract();
                  },
                  child: const Icon(Icons.remove),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
