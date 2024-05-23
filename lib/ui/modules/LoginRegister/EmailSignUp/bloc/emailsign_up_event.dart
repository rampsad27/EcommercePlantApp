part of 'emailsign_up_bloc.dart';

sealed class EmailsignUpEvent {}

final class EmailSignUpRequested extends EmailsignUpEvent {
  final String email;
  final String password;
  final String fname;
  final String lname;
  EmailSignUpRequested({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
  });
}
