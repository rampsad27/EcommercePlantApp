part of 'eventfirebase_bloc.dart';

sealed class EventfirebaseEvent extends Equatable {
  const EventfirebaseEvent();

  @override
  List<Object> get props => [];
}

class AddEvent extends EventEvent {
  final PlantModel plantModel;
  AddEvent({required this.plantModel});
}

class SaveUserEvent extends EventEvent {
  final PlantModel plantModel;
  SaveUserEvent(this.plantModel);
}

class EventEvent {}

class GetEvent extends EventEvent {}

class GetEventById extends EventEvent {
  final String uid;

  GetEventById(this.uid);
}

class DeleteEventById extends EventEvent {
  final String uid;

  DeleteEventById(this.uid);
}
