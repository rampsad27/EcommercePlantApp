import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/emailsignin_repository.dart';

part 'emailsignin_event.dart';
part 'emailsignin_state.dart';

class EmailSigninBloc extends Bloc<EmailSigninEvent, EmailSigninState> {
  final EmailSignInRepository emailSignInRepository;

  EmailSigninBloc({required this.emailSignInRepository})
      : super(EmailSigninInitial()) {
    on<EmailSigninRequested>((event, emit) async {
      emit(EmailSigninLoadInProgress());

      try {
        await emailSignInRepository.signInWithEmailAndPassword(
            event.email, event.password);

        emit(const EmailSigninSuccess(message: "bhayo"));
      } catch (e) {
        emit(const EmailSigninFailure(message: "Account not registered"));
      }
    });
    on<CheckLoggedInUser>((event, emit) async {
      emit(EmailSigninLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));
      try {
        final userCredential = await emailSignInRepository.getUserInfo();
        if (userCredential.user != null) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(UnAuthenticated());
      } // bool isLoggedIn = await authenticationRepository.isUserLoggedIn();
    });
    on<LogInLogOutRequested>((event, emit) async {
      emit(EmailSigninLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));

      await emailSignInRepository.signOut();
      emit(const LogoutSuccess(logoutSuccessMessage: "logoutSuccessMessage"));
    });
  }
}
