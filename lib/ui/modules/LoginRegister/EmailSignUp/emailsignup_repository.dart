import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/ui/modules/model/user.dart';

class EmailSignUpRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUpWithEmailandPassword(
      String email, String password, String fname, String lname) async {
    try {
      print("SIgnin happening");
      UserCredential response = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(response);
      final User? user = response.user;
      if (user == null) {
        throw Exception('User is null');
      }

      // final AuthCredential emailAuthCredential =
      //     EmailAuthProvider.credential(email: email, password: password);

      // await user.linkWithCredential(emailAuthCredential);
      await saveUser(UserEntity(
        email: email,
        password: password,
        fname: fname,
        lname: lname,
        uid: user.uid,
      ));
    } on FirebaseAuthException catch (e) {
      print("Exception has occurred: $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> saveUser(UserEntity userEntity) async {
    CollectionReference collectionReference = _firestore.collection("user");
    DocumentReference dr = collectionReference.doc(userEntity.uid);
    await dr.set(userEntity.toMap());
  }
}
