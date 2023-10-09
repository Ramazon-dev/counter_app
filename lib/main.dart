import 'package:counter_app/app_bloc/theme/theme_cubit.dart';
import 'package:counter_app/screens/home/home_page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'counter app for Ptolemay',
            theme: ThemeData(
              brightness: state.brightness,
            ),
            home: const HomePageWrapper(),
          );
        },
      ),
    );
  }
}
