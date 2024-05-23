import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'emailsignin_event.dart';
part 'emailsignin_state.dart';

class EmailsigninBloc extends Bloc<EmailsigninEvent, EmailsigninState> {
  EmailsigninBloc() : super(EmailsigninInitial()) {
    on<EmailsigninEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
