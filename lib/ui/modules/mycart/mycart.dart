import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/ui/modules/components/plantmodel.dart';
import 'package:plant_app/ui/modules/mycart/bloc/eventfirebase_bloc.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EventBloc, EventState>(
        listenWhen: (previous, current) =>
            previous.eventStateEnum != current.eventStateEnum ||
            previous.error != current.error,
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    BlocBuilder<EventBloc, EventState>(
                      builder: (context, state) {
                        if (state.eventStateEnum == EventStateEnum.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state.eventModelList != null &&
                            state.eventModelList!.isNotEmpty) {
                          return Expanded(
                            child: ListView.separated(
                              //not sep
                              itemBuilder: (context, index) {
                                return null;
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: state.eventModelList!.length,
                            ),
                          );
                        }
                        // else if (state.error != null) {
                        //   return Center(child: Text(state.error!));
                        // }
                        return Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<EventBloc>().add(GetEvent());
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text("Refresh"),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
