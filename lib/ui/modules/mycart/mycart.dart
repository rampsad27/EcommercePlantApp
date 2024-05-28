import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/ui/modules/model/plantmodel.dart';
import 'package:plant_app/ui/modules/mycart/bloc/eventfirebase_bloc.dart';
import 'package:plant_app/ui/modules/widgets/listviewVertical.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<EventBloc>().add(GetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: const Color.fromARGB(255, 240, 238, 238),
      ),
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
        child: Container(
          color: const Color.fromARGB(255, 240, 238, 238),
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
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.eventModelList?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 4.0,
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(state
                                                      .eventModelList![index]
                                                      .imageURL),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              width: 130,
                                              height: 120,
                                            ),
                                          ],
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
                                                state.eventModelList![index]
                                                    .name,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                state.eventModelList![index]
                                                    .type,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${state.eventModelList![index].price}",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        context
                                                            .read<EventBloc>()
                                                            .add(DeleteEventById(
                                                                state
                                                                    .eventModelList![
                                                                        index]
                                                                    .name));
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('No events available.'),
                            );
                          }
                        },
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                            ),
                            height: 50,
                            width: double.infinity,
                            child: const Center(
                                child: Text(
                              "Proceed to checkout",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
