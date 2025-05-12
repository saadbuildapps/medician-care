// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/Ui/auth/loginscreen.dart';
// import 'package:flutter_firebase/Utils/utils.dart';
// import 'package:flutter_firebase/posts/add_posts.dart';

// class PostScreen extends StatefulWidget {
//   const PostScreen({super.key});
//   @override
//   State<PostScreen> createState() => PostScreenState();
// }

// class PostScreenState extends State<PostScreen> {
//   final auth = FirebaseAuth.instance;
//   final ref = FirebaseDatabase.instance.ref('post');
//   // final secondref = FirebaseDatabase.instance.ref('Post');
//   // StreamBuilder  es ko  es lia  bhi use krty han q k es ka use ham inite function ma b kr sakty han ..

//   final searchFilter = TextEditingController();
//   final editController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(  
//       appBar: AppBar(
//         title: const Text(
//           "PostScreen",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 auth.signOut().then((onValue) {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const Loginscreen()));
//                 }).onError((error, stackTrace) {
//                   debugPrint(error.toString());
//                   Utils().toastMessage(error.toString());
//                 });
//               },
//               icon: const Icon(Icons.logout_outlined)),
//           const SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: searchFilter,
//               decoration: const InputDecoration(
//                   hintText: "search", border: OutlineInputBorder()),
//               onChanged: (String value) {
//                 setState(() {});
//               },
//             ),
//           ),
//           // Expanded(
//           //     child: StreamBuilder(
//           //         stream: ref.onValue,
//           //         builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//           //           if (!snapshot.hasData) {
//           //             return const CircularProgressIndicator();
//           //           } else {
//           //             Map<dynamic, dynamic> map =
//           //                 snapshot.data!.snapshot.value as dynamic;
//           //             List<dynamic> list = [];

//           //             list.clear();
//           //             list = map.values.toList();
//           //             return ListView.builder(
//           //                 itemCount: snapshot.data!.snapshot.children.length,
//           //                 itemBuilder: (context, index) {
//           //                   return ListTile(
//           //                     title:
//           //                         Text(list[index]["Description"].toString()),
//           //                     subtitle: Text(list[index]['aab'].toString()),
//           //                   );
//           //                 });
//           //           }
//           //         })),
//           Expanded(
//             child: FirebaseAnimatedList(
//                 query: ref,
//                 defaultChild: const Text("Loading"),
//                 itemBuilder: (context, snapshot, animation, index) {
//                   final tittle = snapshot.child('About').value.toString();
//                   if (searchFilter.text.isEmpty) {
//                     return ListTile(
//                       title:Text(snapshot.child('About').value.toString()),
//                       subtitle: Text(snapshot.child('id').value.toString()),
//                       trailing: PopupMenuButton(
//                           icon: const Icon(Icons.more_vert),
//                           itemBuilder: (context) => [
//                                 PopupMenuItem(
//                                     value: 1,
//                                     child: ListTile(
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                         showMydialogue(tittle,snapshot.child('id').value.toString());
//                                         // showMydialogue(tittle, snapshot.child('id').value.toString());
//                                       },
//                                       leading: const Icon(Icons.edit),
//                                       title: const Text("Edit"),
//                                     )),
//                                 PopupMenuItem(
//                                     onTap: () {
                                 
//                                       ref
//                                           .child(snapshot
//                                               .child('id')
//                                               .value
//                                               .toString())
//                                           .remove();
//                                     },
//                                     value: 1,
//                                     child:  const ListTile(
//                                       leading: Icon(Icons.delete_outline),
//                                       title: Text("Delete"),
//                                     )),
//                               ]),
//                     );
//                   } else if (tittle.toLowerCase().contains(
//                       searchFilter.text.toLowerCase())) {
//                     return ListTile(
                    
//                       title:
//                           Text(snapshot.child('About').value.toString()),
//                       subtitle: Text(snapshot.child('id').value.toString()),
//                     );
//                   } else {
//                     return Container();
//                   }
//                 }),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const AddPostScreen()));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Future<void> showMydialogue(String tittle, String id) async {
//     editController.text = tittle;
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Update'),
//             content:  Container(
//               child: TextField(
//                 controller: editController,
//                 decoration:   const InputDecoration(
//                   hintText: "Edit",
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("cancle")),
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     ref.child(id).update({
//                       'About': editController.text.toLowerCase()
//                     }).then((value) {
//                       Utils().toastMessage("Post updated");
//                     }).onError((error, stackTrace) {
//                       Utils().toastMessage(error.toString());
//                     });
//                   },
//                   child: const Text("update"))
//             ],
//           );
//         });
//   }
// }
