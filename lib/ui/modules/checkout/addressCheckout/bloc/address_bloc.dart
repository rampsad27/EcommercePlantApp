import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/addressModel.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/addressrepository.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const AddressState()) {
    on<AddAddressEvent>((event, emit) async {
      try {
        emit(state.copyWith(error: null));
        await addressRepository.addAddress(event.addressModel);
        emit(state.copyWith(addressStateEnum: AddressStateEnum.success));
      } on FirebaseException catch (e) {
        emit(state.copyWith(
            addressStateEnum: AddressStateEnum.failure,
            error: "${e.code.toString()} ${e.message}"));
      } catch (e) {
        emit(state.copyWith(
            addressStateEnum: AddressStateEnum.failure, error: e.toString()));
      }
    });

    on<GetAddressEvent>((event, emit) async {
      try {
        await emit.forEach(addressRepository.getRealtimeStreamData(),
            onData: (data) {
          return state.copyWith(
            addressStateEnum: AddressStateEnum.success,
            addressModelList: data,
          );
        }, onError: (e, _) {
          return state.copyWith(
            addressStateEnum: AddressStateEnum.failure,
          );
        });
      } catch (e) {
        emit(state.copyWith(
            addressStateEnum: AddressStateEnum.failure, error: e.toString()));
      }
    });
  }

  final AddressRepository addressRepository = getIt.get<AddressRepository>();
}
