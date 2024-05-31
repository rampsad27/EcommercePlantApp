part of 'dark_mode_bloc.dart';

sealed class DarkModeState extends Equatable {
  const DarkModeState();

  @override
  List<Object> get props => [];
}

final class DarkModeInitial extends DarkModeState {}
