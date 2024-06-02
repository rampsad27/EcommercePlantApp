// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_bloc.dart';

abstract class AddressEvent {}

class AddAddressEvent extends AddressEvent {
  AddressModel addressModel;
  AddAddressEvent({required this.addressModel});
}

class GetAddressEvent extends AddressEvent {}
