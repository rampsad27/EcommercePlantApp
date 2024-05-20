import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlantModel {
  final String name;
  final String type;
  final double price;
  final String imageURL;

  PlantModel({
    required this.name,
    required this.type,
    required this.price,
    required this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'price': price,
      'imageURL': imageURL,
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      name: map['name'] as String,
      type: map['type'] as String,
      price: map['price'] as double,
      imageURL: map['imageURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantModel.fromJson(String source) =>
      PlantModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
