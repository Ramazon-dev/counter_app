import 'dart:math';

import 'package:counter_app/app_bloc/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  final ThemeCubit themeCubit;

  CounterCubit(this.themeCubit) : super(0) {
    themeCubit.stream.listen((state) {
      brightness = state.brightness;
    });
  }

  Brightness brightness = Brightness.light;

  void add() {
    final bright = brightness;
    if (bright == Brightness.light) {
      addOne();
    } else {
      addTwo();
    }
  }

  void subtract() {
    final bright = brightness;
    if (bright == Brightness.light) {
      subtractOne();
    } else {
      subtractTwo();
    }
  }

  void addOne() {
    if (state < 10) {
      emit((state + 1));
    }
  }

  void subtractOne() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  void addTwo() {
    if (state < 10) {
      emit(min(state + 2, 10));
    }
  }

  void subtractTwo() {
    if (state > 0) {
      emit(max(state - 2, 0));
    }
  }
}
