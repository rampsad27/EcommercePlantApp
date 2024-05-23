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

class EventEvent {}

class GetEvent extends EventEvent {}

class GetEventById extends EventEvent {
  final String id;

  GetEventById(this.id);
}

class DeleteEventById extends EventEvent {
  final String id;

  DeleteEventById(this.id);
}
