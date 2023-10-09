import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(Brightness.light));

  void onStateChanged() {
    if (state.brightness == Brightness.light) {
      emit(const ThemeState(Brightness.dark));
    } else {
      emit(const ThemeState(Brightness.light));
    }
  }
}
