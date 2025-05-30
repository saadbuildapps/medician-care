import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/firebaseservices/splashscreen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
   const   ProviderScope(
      child: 
         MyApp(),
    ));
}
//

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SplashScreen(),
    );
  }
}
