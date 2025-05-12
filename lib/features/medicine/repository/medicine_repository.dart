import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Core/constants/firebase_constants.dart';
import '../../../Core/providers/firebaseproviders.dart';
import '../../../Models/medicine_model.dart';

final medicineRepositoryProvider = Provider(
    (ref) => MedicineRepository(firestore: ref.read(firestoreProvider)));

class MedicineRepository {
  final FirebaseFirestore _firestore;
  MedicineRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Stream<List<MedicineModel>> fetchMedicines() {
    return _medicines.snapshots().map((event) {
      List<MedicineModel> medicnies = [];
      for (var medicine in event.docs) {
        medicnies.add(
            MedicineModel.fromMap(medicine.data() as Map<String, dynamic> , medicine.id) );
      }
      return medicnies;
    });
  }

  Stream<List<MedicineModel>> searchMedicine(String query) {
    return _medicines
        .where('name',
            isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
            isLessThan: query.isEmpty
                ? null
                : query.substring(0, query.length - 1) +
                    String.fromCharCode(query.codeUnitAt(query.length - 1) + 1))
        .snapshots()
        .map((event) {
      List<MedicineModel> medicnies = [];
      for (var medicine in event.docs) {
        medicnies.add(
            MedicineModel.fromMap(medicine.data() as Map<String, dynamic> ,  medicine.id));
      }
      return medicnies;
    });
  }

Stream<MedicineModel> fetchMedicineById(String id) {
  return _medicines.doc(id).snapshots().map(
    (event) => MedicineModel.fromMap(
      event.data() as Map<String, dynamic>,
      event.id, // 👈 Pass doc ID here
    ),
  );
}
 




  CollectionReference get _medicines =>
      _firestore.collection(FirebaseConstants.medicinesCollection);
}
