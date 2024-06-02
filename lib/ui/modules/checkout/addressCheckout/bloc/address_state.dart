// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_bloc.dart';

enum AddressStateEnum {
  initial,
  loading,
  success,
  failure,
}

class AddressState extends Equatable {
  final AddressStateEnum? addressStateEnum;
  final List<AddressModel>? addressModelList;
  final AddressModel? addressModel;
  final String? error;

  const AddressState({
    this.addressStateEnum,
    this.addressModelList,
    this.addressModel,
    this.error,
  });
  @override
  List<Object?> get props =>
      [addressStateEnum, addressModelList, addressModel, error];

  AddressState copyWith({
    AddressStateEnum? addressStateEnum,
    List<AddressModel>? addressModelList,
    AddressModel? addressModel,
    String? error,
  }) {
    return AddressState(
      addressStateEnum: addressStateEnum ?? addressStateEnum,
      addressModelList: addressModelList ?? addressModelList,
      addressModel: addressModel ?? addressModel,
      error: error ?? this.error,
    );
  }
}
