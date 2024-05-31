import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(DarkModeInitial()) {
    // on<DarkModeChanged>((event, emit) {

    // emit(DarkModeChanged(isDarkMode);
    // PreferenceManager.setDarkMode(isDarkMode);
    // )
    // });
  }
}
