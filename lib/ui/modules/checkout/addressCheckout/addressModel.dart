// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  final String uid;
  final String type;
  final String street;
  final String city;
  final String cityCode;
  AddressModel({
    required this.uid,
    required this.type,
    required this.street,
    required this.city,
    required this.cityCode,
  });

  AddressModel copyWith({
    String? uid,
    String? type,
    String? street,
    String? city,
    String? cityCode,
  }) {
    return AddressModel(
      uid: uid ?? this.uid,
      type: type ?? this.type,
      street: street ?? this.street,
      city: city ?? this.city,
      cityCode: cityCode ?? this.cityCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'type': type,
      'street': street,
      'city': city,
      'cityCode': cityCode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      uid: map['uid'] as String,
      type: map['type'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      cityCode: map['cityCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(uid: $uid, type: $type, street: $street, city: $city, cityCode: $cityCode)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.type == type &&
        other.street == street &&
        other.city == city &&
        other.cityCode == cityCode;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        type.hashCode ^
        street.hashCode ^
        city.hashCode ^
        cityCode.hashCode;
  }
}
