// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:plant_app/ui/data/user.dart';

// class GoogleSignInRepository {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',
//     ],
//   );

//   Future<UserCredential> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       return _firebaseAuth.signInWithCredential(credential);
//     }
//     throw Exception('Sign in with google failed');
//   }

//   Future<void> signUpWithEmailandPassword(String email, String password) async {
//     try {
//       print("SIgnin happening");
//       UserCredential response = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       final User? user = response.user;
//       if (user == null) {
//         throw Exception('User is null');
//       }

//       final AuthCredential emailAuthCredential =
//           EmailAuthProvider.credential(email: email, password: password);

//       await user.linkWithCredential(emailAuthCredential);
//       await saveUser(UserEntity(
//         email: email,
//         password: password,
//         uid: user.uid,
//       ));
//     } on FirebaseAuthException catch (e) {
//       print("Exception has occurred: $e");
//     }
//   }

//   signInWithEmailAndPassword(String email, String password) async {
//     try {
//       final response = await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       print("success $response");

//       var token = await _firebaseAuth.currentUser?.getIdToken(true);

//       print(token);

//       await saveUser(UserEntity(
//           uid: response.user?.uid ?? "", email: email, password: password));
//     } on FirebaseAuthException catch (e) {
//       print("Exception has occured $e");
//     } on Exception catch (e) {
//       print("Exception has occured $e");
//     }
//   }

//   Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     await _firebaseAuth.signOut();
//   }

//   Future<void> saveUser(UserEntity userEntity) async {
//     CollectionReference collectionReference = _firestore.collection("user");
//     DocumentReference dr = collectionReference.doc(userEntity.uid);
//     await dr.set(userEntity.toMap());
//     // await firestore
//     //     .collection('user')
//     //     .doc(userEntity.uid)
//     //     .set(userEntity.copyWith(email: "abcd").toMap());
//   }

//   Future<List<UserEntity>> getUser() async {
//     CollectionReference collectRed =
//         FirebaseFirestore.instance.collection('user');

//     QuerySnapshot querySnapshot = await collectRed.get();

//     final allUserData = querySnapshot.docs
//         .map((doc) => UserEntity.fromMap(doc.data() as Map<String, dynamic>))
//         .toList();

//     print(allUserData);
//     return allUserData;
//   }
// }
