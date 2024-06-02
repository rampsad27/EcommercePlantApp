import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/configs/extension/build_context_extension.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/addressform.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/bloc/address_bloc.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 440,
                width: double.infinity,
                // color: const Color.fromARGB(255, 164, 112, 109),
                child: BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if (state.addressStateEnum == AddressStateEnum.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.addressModelList != null &&
                        state.addressModelList!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: state.addressModelList!.length,
                        itemBuilder: (context, index) {
                          final address = state.addressModelList![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: const Color.fromARGB(255, 242, 242, 242),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        address.type,
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.more_horiz_rounded),
                                    ],
                                  ),
                                  Text(address.street),
                                  Text("${address.city}, ${address.cityCode}"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state.error != null) {
                      return Center(
                        child: Text(state.error!),
                      );
                    } else {
                      return const Center(
                        child: Text("No Address available"),
                      );
                    }
                  },
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const AddressForm();
                  },
                );
              },
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  height: 64,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Add New Address",
                      style: TextStyle(
                        color: appColor.primary,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
