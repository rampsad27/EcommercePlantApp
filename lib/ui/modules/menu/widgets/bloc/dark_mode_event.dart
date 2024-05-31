part of 'dark_mode_bloc.dart';

sealed class DarkModeEvent extends Equatable {
  const DarkModeEvent();

  @override
  List<Object> get props => [];
}

class DarkModeChanged extends DarkModeState {
  final bool isDarkMode;

  const DarkModeChanged(this.isDarkMode);
}
