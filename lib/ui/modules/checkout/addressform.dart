import 'package:flutter/material.dart';

class AddressForm extends StatelessWidget {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController citycodeController = TextEditingController();

  AddressForm({super.key});

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
                  onPressed: () {}, icon: const Icon(Icons.save_alt)))
        ],
      )),
    );
  }
}
