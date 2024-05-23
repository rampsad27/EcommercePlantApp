// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:plant_app/ui/modules/components/plantmodel.dart';
// import 'package:uuid/uuid.dart';

// var uuid = const Uuid();

// class PlantStoreRepository {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> registerdetails(String email, String password, String name,
//       String type, double price, String imageURL, String uid) async {
//     try {
//       print("Detail input happening");
//       UserCredential response = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       print(response);
//       final User? user = response.user;
//       if (user == null) {
//         throw Exception('User is null');
//       }

//       await saveUser(PlantModel(
//         name: name,
//         type: type,
//         price: price,
//         imageURL: imageURL,
//         uid: uuid.v4(),
//       ));
//     } on FirebaseAuthException catch (e) {
//       print("Exception has occurred: $e");
//     }
//   }

//   Future<void> saveUser(PlantModel plantModel) async {
//     CollectionReference collectionReference = _firestore.collection("plalnts");
//     DocumentReference dr = collectionReference.doc(plantModel.uid);
//     await dr.set(plantModel.toMap());
//   }

//   Future<List<PlantModel>> getUser() async {
//     CollectionReference collectRed =
//         FirebaseFirestore.instance.collection('plants');

//     QuerySnapshot querySnapshot = await collectRed.get();

//     final allUserData = querySnapshot.docs
//         .map((doc) => PlantModel.fromMap(doc.data() as Map<String, dynamic>))
//         .toList();

//     print(allUserData);
//     return allUserData;
//   }
// }





//dfffffffffffff
 // Future<List<PlantModel>?> getEvents() async {
  //   CollectionReference cr = _firebaseFirestore.collection(_event);
  //   QuerySnapshot querySnapshot = await cr.get();
  //   var list = querySnapshot.docs
  //       .map((e) => PlantModel.fromJson(e.data() as Map<String, dynamic>))
  //       .toList();
  //   return list;
  // }

  // Future<PlantModel?> getEventsById(String id) async {
  //   CollectionReference cr = _firebaseFirestore.collection(_event);
  //   // var querySnapshot = await cr.where('id', isEqualTo: id).get();
  //   // var list = querySnapshot.docs
  //   //     .map((e) => EventModel.fromJson(e.data() as Map<String, dynamic>))
  //   //     .toList();
  //   // return list;
  //   var res = await cr.doc(id).get();

  //   return PlantModel.fromJson(res.data() as Map<String, dynamic>);
  // }

  // Future<void> deleteEvent(String id) async {
  //   CollectionReference cr = _firebaseFirestore.collection(_event);
  //   await cr.doc(id).delete();
  // }

  // Stream<List<PlantModel>> getRealtimeStreamData() {
  //   CollectionReference cr = _firebaseFirestore.collection(_event);
  //   return cr.snapshots().map((event) {
  //     return event.docs
  //         .map((e) => PlantModel.fromJson(e.data() as Map<String, dynamic>))
  //         .toList();
  //   });
  // }