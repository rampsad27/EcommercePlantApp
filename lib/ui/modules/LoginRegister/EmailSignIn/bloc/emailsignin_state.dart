part of 'emailsignin_bloc.dart';

sealed class EmailsigninState extends Equatable {
  const EmailsigninState();
  
  @override
  List<Object> get props => [];
}

final class EmailsigninInitial extends EmailsigninState {}
