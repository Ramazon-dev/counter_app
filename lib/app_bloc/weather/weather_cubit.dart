import 'package:counter_app/model/weather_model.dart';
import 'package:counter_app/service/weather_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherInitial());

//   4ad1b66c0dfc414f9ab100129230910
  final WeatherService service = WeatherService();

  Future<void> getWeather() async {
    emit(const WeatherLoading());
    final city = await service.getCity();
    debugPrint('city is $city');
    final weather = await service.getWeather(city ?? 'Tashkent');
    debugPrint('weather is $weather');
    if (weather != null) {
      emit(WeatherLoaded(weather));
    } else {
      emit(const WeatherError('something went wrong'));
    }
  }
}
