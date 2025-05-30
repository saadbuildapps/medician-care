// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB1w-4ipVWT_yRp2E6uU5eFX58z2kjSoMU',
    appId: '1:671980916488:web:62c765822476d7ed4826bd',
    messagingSenderId: '671980916488',
    projectId: 'flutter-firebasefirst',
    authDomain: 'flutter-firebasefirst.firebaseapp.com',
    databaseURL: 'https://flutter-firebasefirst-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebasefirst.appspot.com',
    measurementId: 'G-W014TE5ES0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXDVMf19S2If7yk_S4v_ySlLDVuZH0oIg',
    appId: '1:671980916488:android:50cb4edc2f2b984e4826bd',
    messagingSenderId: '671980916488',
    projectId: 'flutter-firebasefirst',
    databaseURL: 'https://flutter-firebasefirst-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebasefirst.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-I4mGt4efyfJS22RAHtHeAouy8BB6pbY',
    appId: '1:671980916488:ios:6f87f8720126c6574826bd',
    messagingSenderId: '671980916488',
    projectId: 'flutter-firebasefirst',
    databaseURL: 'https://flutter-firebasefirst-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebasefirst.appspot.com',
    androidClientId: '671980916488-8hc6olefig3hq40ue9h6q3g000hsp5kf.apps.googleusercontent.com',
    iosClientId: '671980916488-099hltshm82709gpos9g8ftkv92prihl.apps.googleusercontent.com',
    iosBundleId: 'com.example.testing',
  );
}
