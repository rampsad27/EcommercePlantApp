import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/addressModel.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/bloc/address_bloc.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController typeController = TextEditingController();

  final TextEditingController streetController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController citycodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: (Column(
        children: [
          TextField(
            controller: typeController,
            decoration: const InputDecoration(
              labelText: 'Location type',
            ),
          ),
          TextField(
            controller: streetController,
            decoration: const InputDecoration(
              labelText: 'Street Name',
            ),
          ),
          TextField(
            controller: cityController,
            decoration: const InputDecoration(
              labelText: 'City Name',
            ),
          ),
          TextField(
            controller: citycodeController,
            decoration: const InputDecoration(
              labelText: 'City Code',
            ),
          ),
          Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<AddressBloc>().add(AddAddressEvent(
                        addressModel: AddressModel(
                            uid: uuid.v4(),
                            type: typeController.text,
                            street: streetController.text,
                            city: cityController.text,
                            cityCode: citycodeController.text)));
                  },
                  icon: const Icon(Icons.save_alt)))
        ],
      )),
    );
  }
}
