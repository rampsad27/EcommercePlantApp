import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/emailsignup_repository.dart';

part 'emailsign_up_event.dart';
part 'emailsign_up_state.dart';

class EmailsignUpBloc extends Bloc<EmailsignUpEvent, EmailsignUpState> {
  EmailsignUpBloc() : super(EmailsignUpInitial()) {
    on<EmailSignUpRequested>((event, emit) async {
      emit(EmailSignupProcess());
      try {
        await emailSignUpRepository.signUpWithEmailandPassword(
            event.email, event.password, event.fname, event.lname);
        emit(EmailSignupSuccess(successMessage: 'Sign up success'));
      } catch (e) {
        emit(EmailSignupFailed(failureMessage: e.toString()));
      }
    });
  }
  EmailSignUpRepository emailSignUpRepository = getIt<EmailSignUpRepository>();
}
