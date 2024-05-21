// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:ig/repository/event_repository.dart';
// import 'package:ig/ui/data/event.dart';

// part 'eventfirebase_event.dart';
// part 'eventfirebase_state.dart';

// class EventBloc extends Bloc<EventEvent, EventState> {
//   EventBloc({required this.eventRepository}) : super(const EventState()) {
//     on<AddEvent>((event, emit) async {
//       try {
//         emit(state.copyWith(error: null));

//         await eventRepository.addEvent(event.eventModel);
//         emit(state.copyWith(eventStateEnum: EventStateEnum.success));
//       } on FirebaseException catch (e) {
//         emit(state.copyWith(
//             eventStateEnum: EventStateEnum.failure,
//             error: "${e.code.toString()} ${e.message}"));
//       } catch (e) {
//         emit(state.copyWith(
//             eventStateEnum: EventStateEnum.failure, error: e.toString()));
//       }
//     });

//     /// Listens to the `GetEvent` event and retrieves the event data from the repository.
//     ///
//     /// The event data is obtained by calling the `getRealtimeStreamData` function from the
//     /// `eventRepository`. The function handles the loading state by emitting a loading
//     /// state using the `state.copyWith` method. If the data is successfully retrieved, it is
//     /// emitted using the `state.copyWith` method. If an error occurs, an error state is emitted
//     /// using the `state.copyWith` method.
//     on<GetEvent>((event, emit) async {
//       try {
//         // Emit the loading state
//         await emit.forEach(eventRepository.getRealtimeStreamData(),
//             onData: (data) {
//           // Emit the success state with the retrieved data
//           return state.copyWith(
//             eventStateEnum: EventStateEnum.success,
//             eventModelList: data,
//           );
//         }, onError: (e, _) {
//           // Emit the failure state with the error message
//           return state.copyWith(
//             eventStateEnum: EventStateEnum.failure,
//           );
//         });
//       } catch (e) {
//         // Emit the failure state with the error message
//         emit(state.copyWith(
//             eventStateEnum: EventStateEnum.failure, error: e.toString()));
//       }
//     });

//     on<GetEventById>((event, emit) async {
//       try {
//         emit(state.copyWith(eventStateEnum: EventStateEnum.loading));
//         var res = await eventRepository.getEventsById(event.id);
//         emit(state.copyWith(
//           eventStateEnum: EventStateEnum.success,
//           eventModel: res,
//         ));
//       } catch (e) {
//         emit(state.copyWith(
//             eventStateEnum: EventStateEnum.failure, error: e.toString()));
//       }
//     });
//     on<DeleteEventById>((event, emit) async {
//       try {
//         emit(state.copyWith(eventStateEnum: EventStateEnum.loading));
//         await eventRepository.deleteEvent(event.id);

//         // add(GetEvent());
//       } catch (e) {
//         emit(state.copyWith(
//             eventStateEnum: EventStateEnum.failure, error: e.toString()));
//       }
//     });
//   }

//   final EventRepository eventRepository;
// }
