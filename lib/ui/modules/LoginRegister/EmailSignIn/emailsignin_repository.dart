import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/ui/modules/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailSignInRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  EmailSignInRepository() {
    _getSharedPreferenceInstance();
  }

  SharedPreferences? pref;

  Future<void> _getSharedPreferenceInstance() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      await pref?.setString("email", email);
      await pref?.setString("password", password);
      return userCredential;
    } catch (e) {
      log("Erorr found"); //here
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await pref?.remove("email");
    await pref?.remove("password");
  }

  Future<UserCredential> getUserInfo() async {
    await _getSharedPreferenceInstance();
    var email = pref?.getString("email");
    var password = pref?.getString("password");

    if (email != null && password != null) {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_NO_CREDENTIALS',
        message: 'No saved credentials found.',
      );
    }
  }

  UserNameModel getUserInfoEmail() {
    var email = pref?.getString("email");
    return UserNameModel(email: email ?? "");
  }

  Future<List<UserEntity>> getUser() async {
    CollectionReference collectRed =
        FirebaseFirestore.instance.collection('user');

    QuerySnapshot querySnapshot = await collectRed.get();

    final allUserData = querySnapshot.docs
        .map((doc) => UserEntity.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    print(allUserData);
    return allUserData;
  }
}
