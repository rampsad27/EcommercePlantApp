part of 'emailsignin_bloc.dart';

sealed class EmailSigninState extends Equatable {
  const EmailSigninState();

  @override
  List<Object> get props => [];
}

final class EmailSigninInitial extends EmailSigninState {}

final class EmailSigninLoadInProgress extends EmailSigninState {}

final class EmailSigninFailure extends EmailSigninState {
  final String message;
  const EmailSigninFailure({required this.message});
}

final class EmailSigninSuccess extends EmailSigninState {
  final String message;
  const EmailSigninSuccess({required this.message});
}

final class Authenticated extends EmailSigninState {}

final class UnAuthenticated extends EmailSigninState {}

final class LogoutSuccess extends EmailSigninState {
  final String logoutSuccessMessage;
  const LogoutSuccess({
    required this.logoutSuccessMessage,
  });

  @override
  List<Object> get props => [logoutSuccessMessage];
}
