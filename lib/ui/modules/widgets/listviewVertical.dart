import 'package:flutter/material.dart';
import 'package:plant_app/ui/modules/components/model.dart';
import 'package:plant_app/ui/modules/screen/productDetail.dart';

class ListviewVertical extends StatefulWidget {
  const ListviewVertical({super.key, required this.plantModelList});
  final List<PlantModel> plantModelList;

  @override
  State<ListviewVertical> createState() => _ListviewVerticalState();
}

class _ListviewVerticalState extends State<ListviewVertical> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    plantModel: widget.plantModelList[index],
                  ),
                ),
              );
            },
            child: Container(
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
                          image: NetworkImage(
                              widget.plantModelList[index].imageURL),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 140,
                      height: 100,
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
                                width: 130,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
