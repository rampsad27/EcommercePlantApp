import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/authentication_repository.dart';

part 'emailsignin_event.dart';
part 'emailsignin_state.dart';

class EmailSigninBloc extends Bloc<EmailSigninEvent, EmailSigninState> {
  final AuthenticationRepository authenticationRepository;

  EmailSigninBloc({required this.authenticationRepository})
      : super(EmailSigninInitial()) {
    on<EmailSigninRequested>((event, emit) async {
      emit(EmailSigninLoadInProgress());
      await authenticationRepository.saveUserInfo(event.email, event.password);
      emit(const EmailSigninSuccess(message: "bhayo"));
    });
    on<CheckLoggedInUser>((event, emit) async {
      emit(EmailSigninLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));
      // bool isLoggedIn = await authenticationRepository.isUserLoggedIn();
      final userInfo = authenticationRepository.getUserInfo();
      if (userInfo.email.isNotEmpty) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    });
    on<LogInLogOutRequested>((event, emit) async {
      emit(EmailSigninLoadInProgress());
      await Future.delayed(const Duration(seconds: 2));

      final result = await authenticationRepository.logout();
      if (result != null && result == true) {
        emit(UnAuthenticated());
      } else {
        emit(Authenticated());
      }
    });
  }
}
