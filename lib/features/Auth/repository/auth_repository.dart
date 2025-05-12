import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:testing/Core/constants/firebase_constants.dart';
import 'package:testing/Core/failure.dart';
import 'package:testing/Core/providers/firebaseproviders.dart';
import 'package:testing/Core/typedef.dart';
import 'package:testing/Models/user_model.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSigninProvider),
    firestore: ref.read(firestoreProvider)));

class AuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  const AuthRepository(
      {required FirebaseAuth auth,
      required GoogleSignIn googleSignIn,
      required FirebaseFirestore firestore})
      : _auth = auth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.userCollection);
  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle(bool isFromLogin ) async {
    try {
      UserCredential userCredential;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

       if (isFromLogin) {
          userCredential = await _auth.signInWithCredential(credential);
        } else {
          userCredential = await _auth.currentUser!.linkWithCredential(credential);
        }
      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            uid: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            role: 'customer');
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {


      
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final userModel = await getUserData(userCredential.user!.uid).first;
      return right(userModel);
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
