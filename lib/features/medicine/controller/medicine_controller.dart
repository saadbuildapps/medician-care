
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Models/medicine_model.dart';
import '../repository/medicine_repository.dart';

final medicineControllerProvider = Provider((ref) => MedicineController(
    medicineRepository: ref.read(medicineRepositoryProvider), ref: ref));

final fetchMedicineProvider = StreamProvider(
    (ref) => ref.watch(medicineControllerProvider).fetchMedicines());

    final searchMedicineProvider = StreamProvider.family((ref, String query) {
  return ref.watch(medicineControllerProvider).searchMedicine(query);
});

final fetchMedicineByIdProvider = StreamProvider.family<MedicineModel,String>((ref, String id) {
  return ref.watch(medicineControllerProvider).fetchMedicineById(id);
});

class MedicineController {
  final MedicineRepository _medicineRepository;
  final Ref _ref;
  MedicineController({required medicineRepository, required ref})
      : _medicineRepository = medicineRepository,
        _ref = ref;

  Stream<List<MedicineModel>> fetchMedicines() {
    return _medicineRepository.fetchMedicines(); 
  }
  Stream<List<MedicineModel>> searchMedicine( String query) {
    return _medicineRepository.searchMedicine(query);
  }

  Stream<MedicineModel>fetchMedicineById(String id) {
    return _medicineRepository.fetchMedicineById(id);
  }
}
