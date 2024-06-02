import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/addressModel.dart';

class AddressRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAddress(AddressModel addressModel) async {
    CollectionReference collectionReference =
        _firestore.collection('addresses');

    await collectionReference.doc(addressModel.uid).set(addressModel.toMap());
  }

  Future<List<AddressModel>?> getAddresses() async {
    CollectionReference collectionReference =
        _firestore.collection('addresses');
    QuerySnapshot querySnapshot = await collectionReference.get();
    var list = querySnapshot.docs
        .map((e) => AddressModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
    return list;
  }

  Stream<List<AddressModel>> getRealtimeStreamData() {
    //cahnge garna sath aaihalna
    CollectionReference cr = _firestore.collection('addresses');
    return cr.snapshots().map((address) {
      return address.docs
          .map((e) => AddressModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
