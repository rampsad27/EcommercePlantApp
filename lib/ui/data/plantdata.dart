import 'package:plant_app/ui/modules/model/plantmodel.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
List<PlantModel> plantData = [
  PlantModel(
    name: "Peperomia Flex",
    type: "Indoor Plant",
    price: 60.00,
    imageURL:
        "https://images.unsplash.com/photo-1624622434252-5cebd4a99458?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    uid: uuid.v4(),
  ),
  PlantModel(
    name: "Monstera Plant",
    type: "Indoor Plant",
    price: 50.00,
    imageURL:
        "https://images.unsplash.com/photo-1614594975525-e45190c55d0b?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    uid: uuid.v4(),
  ),
  PlantModel(
    name: "Spider Plant",
    type: "Outdoor Plant",
    price: 30.00,
    imageURL:
        "https://images.unsplash.com/photo-1604907899106-bdbf31469ae9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    uid: uuid.v4(),
  ),
  PlantModel(
    name: "Medallion Calathea",
    type: "Indoor Plant",
    price: 60.00,
    imageURL:
        "https://images.unsplash.com/photo-1600411832986-5a4477b64a1c?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    uid: uuid.v4(),
  ),
  PlantModel(
    name: "Peperomia Flex",
    type: "Indoor Plant",
    price: 60.00,
    imageURL:
        "https://images.unsplash.com/photo-1624622434252-5cebd4a99458?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    uid: uuid.v4(),
  ),
  PlantModel(
    name: "Sdferra Plant",
    type: "Indoor Plant",
    price: 50.00,
    imageURL:
        "https://images.unsplash.com/photo-1614594975525-e45190c55d0b?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    uid: uuid.v4(),
  ),
];
