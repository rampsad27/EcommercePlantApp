import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/ui/modules/components/plantmodel.dart';
import 'package:plant_app/ui/modules/mycart/event_repository.dart';

part 'eventfirebase_event.dart';
part 'eventfirebase_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({required this.eventRepository}) : super(const EventState()) {
    on<AddEvent>((event, emit) async {
      try {
        emit(state.copyWith(error: null));

        await eventRepository.addEventAndSaveUser(event.plantModel);
        emit(state.copyWith(eventStateEnum: EventStateEnum.success));
      } on FirebaseException catch (e) {
        emit(state.copyWith(
            eventStateEnum: EventStateEnum.failure,
            error: "${e.code.toString()} ${e.message}"));
        log(e.toString());
      } catch (e) {
        emit(state.copyWith(
            eventStateEnum: EventStateEnum.failure, error: e.toString()));
        log(e.toString());
      }
    });

    on<SaveUserEvent>((event, emit) async {
      try {
        await eventRepository.saveUser(event.plantModel);

        emit(state.copyWith(
          eventStateEnum: EventStateEnum.success,
          snackbarContent: '${event.plantModel.name} added to cart!',
        ));
      } catch (e) {
        emit(state.copyWith(
          eventStateEnum: EventStateEnum.failure,
          error: e.toString(),
          snackbarContent: 'Failed to add ${event.plantModel.name} to cart!',
        ));
        log(e.toString());
      }
    });
    on<GetEvent>((event, emit) async {
      try {
        final events = await eventRepository.getEvents();
        emit(state.copyWith(
          eventStateEnum: EventStateEnum.success,
          eventModelList: events,
        ));
      } catch (e) {
        emit(state.copyWith(
          eventStateEnum: EventStateEnum.failure,
          error: e.toString(),
        ));
      }
    });

    on<DeleteEventById>((event, emit) async {
      try {
        emit(state.copyWith(eventStateEnum: EventStateEnum.loading));
        await eventRepository.deleteEvent(event.name);
        emit(const EventState(eventStateEnum: EventStateEnum.success));
      } catch (e) {
        emit(state.copyWith(
          eventStateEnum: EventStateEnum.failure,
          error: e.toString(),
        ));
      }
    });
  }

  final EventRepository eventRepository;
}
