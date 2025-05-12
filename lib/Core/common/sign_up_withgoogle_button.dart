import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/Auth/controller/auth_controller.dart';
import '../../features/posts/repository/postmedicines_repository.dart';
import '../constants/constants.dart';

class SignInGoogleButton extends ConsumerWidget {
 final   bool isFromLogin; 
  const SignInGoogleButton({super.key, this.isFromLogin = true });

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle(context, isFromLogin);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MedicineDataUploadScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        icon: Image.asset(
          Constants.googlePath,
          height: 45,
          width: 45,
        ),
        label: const Text(
          'Continue with Google',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
