import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/ui/modules/components/model.dart';

class ListviewHorizontal extends StatefulWidget {
  const ListviewHorizontal({super.key, required this.plantModelList});
  final List<PlantModel> plantModelList;
  @override
  State<ListviewHorizontal> createState() => _ListviewHorizontalState();
}

class _ListviewHorizontalState extends State<ListviewHorizontal> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            width: 240,
            height: 240,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 237, 238, 239),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.plantModelList[index].imageURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 240,
                        height: 140,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/svg/heart1.svg',
                            color: Colors.green,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.plantModelList[index].name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.plantModelList[index].type,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${widget.plantModelList[index].price.toString()}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 150,
                          ),
                          const Icon(
                            Icons.energy_savings_leaf_sharp,
                            color: Colors.green,
                          )
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
  }
}
