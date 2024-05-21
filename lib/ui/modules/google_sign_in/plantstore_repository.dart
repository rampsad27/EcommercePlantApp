import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/ui/modules/components/model.dart';

class PlantStoreRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerdetails(String email, String password, String name,
      String type, double price, String imageURL) async {
    try {
      print("Detail input happening");
      UserCredential response = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(response);
      final User? user = response.user;
      if (user == null) {
        throw Exception('User is null');
      }

      await saveUser(PlantModel(
        name: name,
        type: type,
        price: price,
        imageURL: imageURL,
      ));
    } on FirebaseAuthException catch (e) {
      print("Exception has occurred: $e");
    }
  }

  Future<void> saveUser(PlantModel plantModel) async {
    CollectionReference collectionReference = _firestore.collection("plants");
    DocumentReference dr = collectionReference.doc(plantModel.name);
    await dr.set(plantModel.toMap());
  }

  Future<List<PlantModel>> getUser() async {
    CollectionReference collectRed =
        FirebaseFirestore.instance.collection('plants');

    QuerySnapshot querySnapshot = await collectRed.get();

    final allUserData = querySnapshot.docs
        .map((doc) => PlantModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    print(allUserData);
    return allUserData;
  }
}
