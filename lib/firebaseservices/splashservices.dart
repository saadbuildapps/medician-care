import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/firebaseservices/role_screen.dart';
// import 'package:flutter_firebase/Ui/auth/loginscreen.dart';
// import 'package:flutter_firebase/Ui/upload_image.dart';
// import 'package:flutter_firebase/posts/post_screen.dart';

// class Splashservices {
//   void isLogin(BuildContext context) {
//     final auth = FirebaseAuth.instance;
//     final user = auth.currentUser;
//     // if (user != null) {
//     //   Timer(
//     //       const Duration(seconds: 4),
//     //       () => Navigator.pushReplacement(context,
//     //           MaterialPageRoute(builder: (context) => const PostScreen())));

//     if (user != null) {
//       Timer(
//           const Duration(seconds: 4),
//           () => Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const UploadImageScreen())));
//     } else {
//       Timer(
//           const Duration(seconds: 4),
//           () => Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => const Loginscreen())));
//     }
//   }
// }

class SplashServices {
  void isLogin(BuildContext context) {

    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RoleScreen())));
  }
}
