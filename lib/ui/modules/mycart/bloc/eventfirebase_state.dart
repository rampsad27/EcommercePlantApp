part of 'eventfirebase_bloc.dart';

sealed class EventfirebaseState extends Equatable {
  const EventfirebaseState();

  @override
  List<Object> get props => [];
}

final class EventfirebaseInitial extends EventfirebaseState {}

enum EventStateEnum { initial, loading, success, failure }

class EventState extends Equatable {
  final EventStateEnum? eventStateEnum;
  final List<PlantModel>? eventModelList;
  final PlantModel? eventModel;

  final String? error;
  const EventState({
    this.eventStateEnum,
    this.eventModelList,
    this.eventModel,
    this.error,
  });

  @override
  List<Object?> get props =>
      [eventStateEnum, eventModelList, eventModel, error];

  EventState copyWith({
    EventStateEnum? eventStateEnum,
    List<PlantModel>? eventModelList,
    PlantModel? eventModel,
    String? error,
  }) {
    return EventState(
      eventStateEnum: eventStateEnum ?? this.eventStateEnum,
      eventModelList: eventModelList ?? this.eventModelList,
      eventModel: eventModel ?? this.eventModel,
      error: error ?? this.error,
    );
  }
}
