import 'dart:io';
import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:plant_app/ui/modules/components/plantmodel.dart';
import 'package:plant_app/ui/modules/mycart/bloc/eventfirebase_bloc.dart';

class EventRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final String _event = 'planttt';
  Future<void> addEventAndSaveUser(PlantModel plantModel) async {
    CollectionReference cr = _firebaseFirestore.collection(_event);
    plantModel = plantModel.copyWith(imageUrl: await uploadImage());
    await cr.doc(plantModel.name).set(plantModel.toMap());
    await saveUser(plantModel);
  }

  Future<void> saveUser(PlantModel plantModel) async {
    CollectionReference cr = _firebaseFirestore.collection(_event);
    plantModel = plantModel.copyWith(imageUrl: await uploadImage());
    await cr.doc(plantModel.name).set(plantModel.toMap());
  }

  Future<List<PlantModel>?> getEvents() async {
    CollectionReference cr = _firebaseFirestore.collection(_event);
    QuerySnapshot querySnapshot = await cr.get();
    var list = querySnapshot.docs
        .map((e) => PlantModel.fromJson(e.data() as String))
        .toList();
    return list;
  }

  Future<void> deleteEvent(String id) async {
    CollectionReference cr = _firebaseFirestore.collection(_event);
    await cr.doc(id).delete();
  }

//storage
  Future<String> uploadImage() async {
    Reference ref = _firebaseStorage.ref(_event).child("/images}");

    var res =
        await ref.putFile(await getFileFromAssets()); //4.retured and upload
    var url = await res.ref.getDownloadURL(); //ref url tanyo
    return url;
  }

  Future<File> getFileFromAssets() async {
    //chipkaide
    var tempDir = await getTemporaryDirectory();
    var file = File('${tempDir.path}/1.png'); //append in dir
    var bytes = await rootBundle.load('assets/img/1.png'); // 2.load img
    await file.writeAsBytes(//3.write gar
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }
}
