import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../medicine/medicinescreens/medicinescreen.dart';


class MedicineDataUploadScreen extends StatelessWidget {
  const MedicineDataUploadScreen({super.key});

  Future<void> uploadCsvDataToFirestore() async {
    final rawData = await rootBundle
        .loadString('assets/medicines_100_only_with_image_links.csv');
    List<List<dynamic>> csvData =
        const CsvToListConverter().convert(rawData, eol: '\n');

    // Extract column names from the first row
    List<dynamic> header = csvData[0];

    // Upload each row as a Firestore document
    for (int i = 1; i < csvData.length; i++) {
      Map<String, dynamic> rowData = {
        for (int j = 0; j < header.length; j++)
          header[j].toString(): csvData[i][j]
      };

      await FirebaseFirestore.instance.collection('medicines').add(rowData);
    }

    print("✅ Upload completed!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Upload CSV to Firestore")),
        body: Column(
          children: [
            // Center(
            //   child: ElevatedButton(
            //     onPressed: uploadCsvDataToFirestore,
            //     child: const Text("Upload Medicines"),
            //   ),
            // ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Medicinescreen()));
                },
                child: const Text("Move to the medicine screen"),
              ),
            ),
          ],
        ));
  }
}

// class PostmedicinesRepository {


//   Future<void> uploadCsvDataToFirestore() async {
//     final rawData = await rootBundle
//         .loadString('assets/medicines_100_only_with_image_links.csv');
//     List<List<dynamic>> csvData =
//         const CsvToListConverter().convert(rawData, eol: '\n');

//     // Extract column names from the first row
//     List<dynamic> header = csvData[0];

//     // Upload each row as a Firestore document
//     for (int i = 1; i < csvData.length; i++) {
//       Map<String, dynamic> rowData = {
//         for (int j = 0; j < header.length; j++)
//           header[j].toString(): csvData[i][j]
//       };

//       await FirebaseFirestore.instance
//           .collection(FirebaseConstants.medicinesCollection)
//           .add(rowData);
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/Models/medicine_model.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:your_app/models/medicine_model.dart'; // ← Replace with actual path

// class AddMedicineScreen extends StatefulWidget {
//   const AddMedicineScreen({super.key});

//   @override
//   State<AddMedicineScreen> createState() => _AddMedicineScreenState();
// }

// class _AddMedicineScreenState extends State<AddMedicineScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController genericController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();
//   final TextEditingController expiryController = TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController detailsController = TextEditingController();
//   final TextEditingController manufacturerController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();

//   File? imageFile;
//   bool isLoading = false;

//   Future<void> pickImage() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         imageFile = File(picked.path);
//       });
//     }
//   }

//   Future<String> uploadImageToFirebase(File file) async {
//     final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
//     final ref = FirebaseStorage.instance.ref().child('medicine_images/$fileName');
//     await ref.putFile(file);
//     return await ref.getDownloadURL();
//   }

//   void clearForm() {
//     nameController.clear();
//     genericController.clear();
//     quantityController.clear();
//     expiryController.clear();
//     typeController.clear();
//     detailsController.clear();
//     manufacturerController.clear();
//     priceController.clear();
//     setState(() {
//       imageFile = null;
//     });
//   }

//   Future<void> uploadDataToFirebase() async {
//     if (imageFile == null || nameController.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all required fields")));
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       final imageUrl = await uploadImageToFirebase(imageFile!);


//       final medicine = MedicineModel(
//         name: nameController.text.trim(),
//         generic: genericController.text.trim(),
//         description: detailsController.text.trim(),
//         imageUrl: imageUrl,
//         manufacturer: manufacturerController.text.trim(),
//         type: typeController.text.trim(),
//         quantity: int.tryParse(quantityController.text.trim()) ?? 0,
//         price: int.tryParse(priceController.text.trim()) ?? 0,
//         expiryDate: expiryController.text.trim(),
//         timestamp: DateTime.now(),
//       );

//       await FirebaseFirestore.instance.collection('medicine').add(medicine.toMap());

//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Medicine added successfully")));

//       clearForm();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Admin Add Medicine')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Medicine Name')),
//             TextField(controller: genericController, decoration: const InputDecoration(labelText: 'Generic Name')),
//             TextField(controller: manufacturerController, decoration: const InputDecoration(labelText: 'Manufacturer')),
//             TextField(controller: priceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Price')),
//             TextField(controller: quantityController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Quantity')),
//             TextField(controller: expiryController, decoration: const InputDecoration(labelText: 'Expiry Date (MM/YYYY)')),
//             TextField(controller: typeController, decoration: const InputDecoration(labelText: 'Type (Tablet, Syrup etc)')),
//             TextField(controller: detailsController, decoration: const InputDecoration(labelText: 'Description / Detail')),

//             const SizedBox(height: 16),
//             imageFile != null
//                 ? Image.file(imageFile!, height: 100)
//                 : ElevatedButton(onPressed: pickImage, child: const Text("Upload Photo")),

//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading ? null : uploadDataToFirebase,
//               child: isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text("Add Medicine"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
