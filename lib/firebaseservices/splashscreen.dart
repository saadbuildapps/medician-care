// import 'package:flutter/material.dart';
// import 'package:testing/Core/constants/constants.dart';
// import 'package:testing/firebaseservices/splashservices.dart';


// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   final  SplashServices _splashServices = SplashServices();

//   @override
//   void initState() {
//     super.initState();
//     _splashServices.isLogin(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Column(
//         children: [Image(image: AssetImage(Constants.plusSplashpath))],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:async';
import 'package:testing/Core/constants/constants.dart';
import 'package:testing/firebaseservices/splashservices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start fade-in animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate after delay
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          opacity: _opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Constants.medicineSplashPath, height: 100, width: 300,),
              // const SizedBox(height: 14),
              const Text(
                "Medicine Care",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}