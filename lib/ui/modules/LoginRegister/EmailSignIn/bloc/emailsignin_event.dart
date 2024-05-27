part of 'emailsignin_bloc.dart';

sealed class EmailSigninEvent extends Equatable {
  const EmailSigninEvent();

  @override
  List<Object> get props => [];
}

final class EmailSigninRequested extends EmailSigninEvent {
  final String email;
  final String password;

  const EmailSigninRequested({required this.email, required this.password});
}

class CheckLoggedInUser extends EmailSigninEvent {
  @override
  List<Object> get props => [];
}

final class LogInLogOutRequested extends EmailSigninEvent {}
