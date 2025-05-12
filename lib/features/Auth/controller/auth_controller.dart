import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/Core/utilis.dart';
import 'package:testing/Models/user_model.dart';
import 'package:testing/features/Auth/repository/auth_repository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);
final authControllerProvider = Provider((ref) => AuthController(
      authRepository: ref.watch(authRepositoryProvider),
      ref: ref,
    ));
final authStateChangeProvider = Provider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.authStateChange;
});

class AuthController {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref;

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void signInWithGoogle(BuildContext context,  bool isFromLogin) async {
    final user = await _authRepository.signInWithGoogle(isFromLogin);
    user.fold(
        (l) => showSnackBar(context, l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  void signInWithEmail(
      { required BuildContext context, required  String email,  required  String password}) async {
    final user = await _authRepository
        .signInWithEmailAndPassword(email: email, password: password);
    user.fold(
        (l) => showSnackBar(context, l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }
}
