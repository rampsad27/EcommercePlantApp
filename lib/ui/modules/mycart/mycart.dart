import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/ui/modules/components/plantmodel.dart';
import 'package:plant_app/ui/modules/mycart/bloc/eventfirebase_bloc.dart';
import 'package:plant_app/ui/modules/widgets/listviewVertical.dart';

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
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                width: 240,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 238, 239, 240),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(state
                                                .eventModelList![index]
                                                .imageURL),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        width: 140,
                                        height: 100,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "e $index - ${state.eventModelList![index].name}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Type $index - ${state.eventModelList![index].type}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Price $index - ${state.eventModelList![index].price}",
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 130,
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.delete_outline),
                                                  color: Colors.green,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    context
                                                        .read<EventBloc>()
                                                        .add(DeleteEventById(
                                                            state
                                                                .eventModelList![
                                                                    index]
                                                                .uid));
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('No events available.'),
                          );
                        }
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
