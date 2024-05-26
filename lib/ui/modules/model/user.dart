import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String email;
  final String password;
  final String fname;
  final String lname;
  final String uid;

  UserEntity({
    required this.email,
    required this.password,
    required this.fname,
    required this.lname,
    required this.uid,
  });

  UserEntity copyWith({
    String? email,
    String? password,
    String? fname,
    String? lname,
    String? uid,
  }) {
    return UserEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'fname': fname,
      'lname': lname,
      'uid': uid,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'] as String,
      password: map['password'] as String,
      fname: map['fname'] as String,
      lname: map['lname'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserEntity(email: $email, password: $password, fname: $fname, lname: $lname, uid: $uid)';
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.fname == fname &&
        other.lname == lname &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        fname.hashCode ^
        lname.hashCode ^
        uid.hashCode;
  }
}
