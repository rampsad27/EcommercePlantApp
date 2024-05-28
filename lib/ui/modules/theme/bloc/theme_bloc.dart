import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    /// It emits the [ThemeChanged] state with the new theme data and mode.
    /// The theme mode is determined by the brightness of the theme data.
    on<ThemeChangeRequested>((event, emit) {
      emit(ThemeChanged(
        themeData: event.themeData,

        /// We are looking the brightness because we have set it up in our
        /// theme data inside the colorScheme.
        /// We had set brightness in the colorScheme as dark or light.
        themeMode: event.themeData.brightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
      ));
    });
  }
}
