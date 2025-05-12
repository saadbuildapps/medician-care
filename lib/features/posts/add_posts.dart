// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/Utils/utils.dart';
// import 'package:flutter_firebase/widget/roundbutton.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});
//   @override
//   State<AddPostScreen> createState() => AddPostScreenState();
// }

// class AddPostScreenState extends State<AddPostScreen> {
//   bool loading = false;
//   final databaseRef = FirebaseDatabase.instance
//       .ref('post'); // ITS  A Node  a table name called  post

//   // final databaseRef = FirebaseDatabase.instance.ref('Detail');
//   final postEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add post"),
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 40,
//             ),
//             TextFormField(
//               maxLines: 4,
//               controller: postEditingController,
//               decoration: const InputDecoration(
//                 hintText: "add your post",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             RoundButtonScreen(
//                 tittle: "Add",
//                 loading: loading,
//                 // ontaP: () {
//                 //   setState(() {
//                 //     loading = true;
//                 //   });
//                 //   databaseRef.child('kkk').set({
//                 //     'Description': postEditingController.text.toString(),
//                 //     'aab': 5
//                 //   }).then((value) {
//                 //     setState(() {
//                 //       loading = false;
//                 //     });
//                 //     Utils().toastMessage("Post added Successfully");
//                 //   }).onError((error, stackTrace) {
//                 //     Utils().toastMessage(error.toString());
//                 //     setState(() {
//                 //       loading = false;
//                 //     });
//                 //   });
//                 //   }
//                 ontaP: () {
//                   setState(() {
//                     loading = true;
//                   });

//                   // databaseRef
//                   // .child(DateTime.now().millisecondsSinceEpoch.toString())
//                   //         .child("comments")

//                   // 'id': DateTime.now().millisecondsSinceEpoch.toString()
//                   String id = DateTime.now().millisecondsSinceEpoch.toString();
//                   databaseRef.child(id).set({
//                     'About': postEditingController.text.toString(),
//                     'id': id
//                   }).then((value) {
//                     setState(() {
//                       loading = false;
//                     });
//                     Utils().toastMessage("Post added Successfully");
//                   }).onError((error, stackTrace) {
//                     Utils().toastMessage(error.toString());
//                     setState(() {
//                       loading = false;
//                     });
//                   });
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
