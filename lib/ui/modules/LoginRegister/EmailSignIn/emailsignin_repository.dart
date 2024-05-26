import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/ui/modules/model/user.dart';

class EmailSignInRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("success $response");

      var token = await _firebaseAuth.currentUser?.getIdToken(true);

      print(token);
    } on FirebaseAuthException catch (e) {
      print("Exception has occured $e");
    } on Exception catch (e) {
      print("Exception has occured $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
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
