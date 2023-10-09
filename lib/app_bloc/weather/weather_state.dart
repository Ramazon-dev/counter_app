part of 'weather_cubit.dart';

class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  const WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String error;
  const WeatherError(this.error);
}
