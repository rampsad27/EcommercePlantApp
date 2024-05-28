part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeChanged extends ThemeState {
  final ThemeData themeData;
  final ThemeMode themeMode;

  ThemeChanged({required this.themeData, required this.themeMode});
}
