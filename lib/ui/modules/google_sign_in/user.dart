import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String uid;
  final String email;
  final String password;
  UserEntity({
    required this.uid,
    required this.email,
    required this.password,
  });

  UserEntity copyWith({
    String? uid,
    String? email,
    String? password,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserEntity(uid: $uid, email: $email, password: $password)';

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode ^ password.hashCode;
}
