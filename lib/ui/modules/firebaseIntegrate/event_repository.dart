// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:plant_app/ui/modules/components/model.dart';

// class EventRepository {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

//   final String _event = 'event';

//   Future<void> addEvent(PlantModel eventModel) async {
//     CollectionReference cr = _firebaseFirestore.collection(_event);
//     eventModel =
//         eventModel.copyWith(imageUrl: await uploadImage()); //8. ya aayo
//     await cr
//         .doc(eventModel.id)
//         .set(eventModel.toJson()); // 9.aru bela jastai id banayear set
//   }

//   Future<List<PlantModel>?> getEvents() async {
//     CollectionReference cr = _firebaseFirestore.collection(_event);
//     QuerySnapshot querySnapshot = await cr.get();
//     var list = querySnapshot.docs
//         .map((e) => PlantModel.fromJson(e.data() as Map<String, dynamic>))
//         .toList();
//     return list;
//   }

//   Future<PlantModel?> getEventsById(String id) async {
//     CollectionReference cr = _firebaseFirestore.collection(_event);
//     // var querySnapshot = await cr.where('id', isEqualTo: id).get();
//     // var list = querySnapshot.docs
//     //     .map((e) => EventModel.fromJson(e.data() as Map<String, dynamic>))
//     //     .toList();
//     // return list;
//     var res = await cr.doc(id).get();

//     return PlantModel.fromJson(res.data() as Map<String, dynamic>);
//   }

//   Future<void> deleteEvent(String id) async {
//     CollectionReference cr = _firebaseFirestore.collection(_event);
//     await cr.doc(id).delete();
//   }

//   Stream<List<PlantModel>> getRealtimeStreamData() {
//     CollectionReference cr = _firebaseFirestore.collection(_event);
//     return cr.snapshots().map((event) {
//       return event.docs
//           .map((e) => PlantModel.fromJson(e.data() as Map<String, dynamic>))
//           .toList();
//     });
//   }

// //for image ref
//   Future<String> uploadImage() async {
//     Reference ref = _firebaseStorage
//         .ref(_event)
//         .child("/${DateTime.now().millisecondsSinceEpoch}");

//     var res =
//         await ref.putFile(await getFileFromAssets()); //4.retured and upload
//     var url = await res.ref.getDownloadURL(); //ref url tanyo
//     return url;
//   }

//   Future<File> getFileFromAssets() async {
//     //chipkaide
//     var tempDir = await getTemporaryDirectory();
//     var file = File(
//         '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg'); //append in dir
//     var bytes = await rootBundle.load('assets/images/sb.jpg'); // 2.load img
//     await file.writeAsBytes(//3.write gar
//         bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
//     return file;
//   }
// }
