part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocsuccess extends WeatherBlocState {

  final WeatherBlocsuccess (this.weather);

  @override
  List
}

