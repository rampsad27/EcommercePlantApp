part of 'emailsign_up_bloc.dart';

sealed class EmailsignUpState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EmailsignUpInitial extends EmailsignUpState {}

class EmailSignupSuccess extends EmailsignUpState {
  final String successMessage;
  EmailSignupSuccess({
    required this.successMessage,
  });

  @override
  List<Object> get props => [successMessage];
}

class EmailSignupFailed extends EmailsignUpState {
  final String failureMessage;
  EmailSignupFailed({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [failureMessage];
}

class EmailSignupProcess extends EmailsignUpState {}
