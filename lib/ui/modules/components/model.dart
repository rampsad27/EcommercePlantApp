import 'dart:convert';

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
      PlantModel.fromMap(json.decode(source) as Map<String, dynamic>); //convert

  PlantModel copyWith({
    String? name,
    String? type,
    double? price,
    String? imageURL,
  }) {
    return PlantModel(
      name: name ?? this.name,
      type: type ?? this.type,
      price: price ?? this.price,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  @override
  String toString() {
    return 'PlantModel(name: $name, type: $type, price: $price, imageURL: $imageURL)';
  }

  @override
  bool operator ==(covariant PlantModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        other.price == price &&
        other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return name.hashCode ^ type.hashCode ^ price.hashCode ^ imageURL.hashCode;
  }
}
