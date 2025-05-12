// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter/services.dart'; // For HapticFeedback

// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:testing/Core/common/sign_up_withgoogle_button.dart';
// // import 'package:testing/Core/utilis.dart';
// // import 'package:testing/features/Auth/controller/auth_controller.dart';
// // import 'package:testing/features/posts/repository/postmedicines_repository.dart';

// // class LoginScreen extends ConsumerStatefulWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends ConsumerState<LoginScreen> {
// //   final emailController = TextEditingController();
// //   final passwordController = TextEditingController();
// //   final emailFocusNode = FocusNode();
// //   final passwordFocusNode = FocusNode();
// //   final formKey = GlobalKey<FormState>();
// //   bool _isObscure = true;

// //   @override
// //   void dispose() {
// //     emailController.dispose();
// //     passwordController.dispose();
// //     emailFocusNode.dispose();
// //     passwordFocusNode.dispose();
// //     super.dispose();
// //   }

// //   void loginWithEmail() {
// //     if (formKey.currentState!.validate()) {
// //       final email = emailController.text.trim();
// //       final password = passwordController.text.trim();

// //       ref.read(authControllerProvider).signInWithEmail(
// //             context: context,
// //             email: email,
// //             password: password,
// //           );

// //       Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //               builder: (context) => const MedicineDataUploadScreen()));
// //     } else {
// //       HapticFeedback.vibrate(); // Vibrate device on validation error
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         // systemOverlayStyle: const SystemUiOverlayStyle(
// //         //   statusBarColor: Colors.white,
// //         //   statusBarIconBrightness: Brightness.dark,
// //         // ),

// //         title: const Text(
// //           'Login Screen',
// //           style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// //         ),
// //         backgroundColor: Colors.white,
// //         centerTitle: true,
// //         // backgroundColor: Colors.deepPurpleAccent,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: formKey,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               TextFormField(
// //                 controller: emailController,
// //                 focusNode: emailFocusNode,
// //                 keyboardType: TextInputType.emailAddress,
// //                 textInputAction: TextInputAction.next,
// //                 decoration: InputDecoration(
// //                   hintText: 'Email',
// //                   labelText: 'Email',
// //                   prefixIcon: const Icon(Icons.email),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(15),
// //                   ),
// //                   errorBorder: const OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.red),
// //                   ),
// //                   focusedErrorBorder: const OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.red),
// //                   ),
// //                 ),
// //                 onFieldSubmitted: (value) {
// //                   Utilis.onChangeField(
// //                       context, emailFocusNode, passwordFocusNode);
// //                 },
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter email';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 16),
// //               TextFormField(
// //                 controller: passwordController,
// //                 focusNode: passwordFocusNode,
// //                 obscureText: _isObscure,
// //                 obscuringCharacter: '*',
// //                 textInputAction: TextInputAction.done,
// //                 decoration: InputDecoration(
// //                   hintText: 'Password',
// //                   labelText: 'Password',
// //                   prefixIcon: const Icon(Icons.lock),
// //                   suffixIcon: IconButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         _isObscure = !_isObscure;
// //                       });
// //                     },
// //                     icon: Icon(
// //                       _isObscure ? Icons.visibility_off : Icons.visibility,
// //                     ),
// //                   ),
// //                   errorBorder: const OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.red),
// //                   ),
// //                   focusedErrorBorder: const OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.red),
// //                   ),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter password';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 50),
// //               // SizedBox(
// //               //   width: double.infinity,
// //               //   child: ElevatedButton.icon(
// //               //       onPressed: loginWithEmail,
// //               //       style: ElevatedButton.styleFrom(
// //               //         backgroundColor: Colors.green,
// //               //         padding: const EdgeInsets.symmetric(vertical: 16),
// //               //         shape: RoundedRectangleBorder(
// //               //           borderRadius: BorderRadius.circular(16),
// //               //         ),
// //               //       ),
// //               //       // icon: const Icon(Icons.shopping_cart,
// //               //       //     color: Colors.white),
// //               //       label: const Text(
// //               //         'LOGIN',
// //               //         style: TextStyle(fontSize: 18, color: Colors.white),
// //               //       )),
// //               // ),
// //               // const SizedBox(height: 50),
// //               Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: ElevatedButton(
// //                   onPressed: loginWithEmail,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.green,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(15),
// //                     ),
// //                     minimumSize: const Size(double.infinity, 60),
// //                   ),
// //                   child: const Text(
// //                     'Login',
// //                     style: TextStyle(color: Colors.white, fontSize: 20),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               Divider(
// //                 color: Colors.grey.shade400,
// //                 thickness: 0.5,
// //               ),
// //               const Text(
// //                 'OR',
// //                 style: TextStyle(fontSize: 20),
// //               ),
// //               const SizedBox(height: 20),
// //               const SignInGoogleButton(),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:testing/Core/common/sign_up_withgoogle_button.dart';
// import 'package:testing/Core/utilis.dart';
// import 'package:testing/features/Auth/controller/auth_controller.dart';
// import 'package:testing/features/posts/repository/postmedicines_repository.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//   bool _isObscure = true;

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void loginWithEmail() {
//     if (formKey.currentState!.validate()) {
//       final email = emailController.text.trim();
//       final password = passwordController.text.trim();

//       ref.read(authControllerProvider).signInWithEmail(
//             context: context,
//             email: email,
//             password: password,
//           );

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => const MedicineDataUploadScreen()),
//       );
//     } else {
//       HapticFeedback.vibrate();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 const Icon(Icons.arrow_back, size: 28),
//                 const SizedBox(height: 30),
//                 const Center(
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 TextFormField(
//                   controller: emailController,
//                   focusNode: emailFocusNode,
//                   keyboardType: TextInputType.emailAddress,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onFieldSubmitted: (_) {
//                     Utilis.onChangeField(
//                         context, emailFocusNode, passwordFocusNode);
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: passwordController,
//                   focusNode: passwordFocusNode,
//                   obscureText: _isObscure,
//                   obscuringCharacter: '*',
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isObscure
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isObscure = !_isObscure;
//                         });
//                       },
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter password';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 30),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     onPressed: loginWithEmail,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         color: Colors.grey.shade400,
//                         thickness: 1,
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text("OR"),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: Colors.grey.shade400,
//                         thickness: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 const SignInGoogleButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/services.dart';
// import 'package:testing/Core/common/sign_up_withgoogle_button.dart';
// import 'package:testing/Core/utilis.dart';
// import 'package:testing/features/Auth/controller/auth_controller.dart';
// import 'package:testing/features/posts/repository/postmedicines_repository.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//   bool _isObscure = true;

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void loginWithEmail() {
//     if (formKey.currentState!.validate()) {
//       final email = emailController.text.trim();
//       final password = passwordController.text.trim();

//       ref.read(authControllerProvider).signInWithEmail(
//             context: context,
//             email: email,
//             password: password,
//           );

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => const MedicineDataUploadScreen()),
//       );
//     } else {
//       HapticFeedback.vibrate();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back button
//                 IconButton(
//                   icon: const Icon(Icons.arrow_back),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 const SizedBox(height: 30),

//                 // Login Text
//                 const Center(
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // Email Field
//                 TextFormField(
//                   controller: emailController,
//                   focusNode: emailFocusNode,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     prefixIcon: const Icon(Icons.email_outlined),
//                     filled: true,
//                     fillColor: Colors.grey[100],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) =>
//                       value!.isEmpty ? 'Please enter your email' : null,
//                   onFieldSubmitted: (_) {
//                     Utilis.onChangeField(
//                         context, emailFocusNode, passwordFocusNode);
//                   },
//                 ),
//                 const SizedBox(height: 20),

//                 // Password Field
//                 TextFormField(
//                   controller: passwordController,
//                   focusNode: passwordFocusNode,
//                   obscureText: _isObscure,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     prefixIcon: const Icon(Icons.lock_outline),
//                     filled: true,
//                     fillColor: Colors.grey[100],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: BorderSide.none,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isObscure ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isObscure = !_isObscure;
//                         });
//                       },
//                     ),
//                   ),
//                   validator: (value) =>
//                       value!.isEmpty ? 'Please enter your password' : null,
//                 ),
//                 const SizedBox(height: 30),

//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     onPressed: loginWithEmail,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green.shade700,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                     ),
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25),

//                 // OR Divider
//                 Row(
//                   children: [
//                     const Expanded(child: Divider()),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child:
//                           Text("OR", style: TextStyle(color: Colors.grey[600])),
//                     ),
//                     const Expanded(child: Divider()),
//                   ],
//                 ),
//                 const SizedBox(height: 25),

//                 // Google Sign In Button
//                 const SignInGoogleButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/Core/common/sign_up_withgoogle_button.dart';
import 'package:testing/Core/constants/constants.dart';
import 'package:testing/features/Auth/controller/auth_controller.dart';
import 'package:testing/features/posts/repository/postmedicines_repository.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginWithEmail() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      ref.read(authControllerProvider).signInWithEmail(
            context: context,
            email: email,
            password: password,
          );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MedicineDataUploadScreen(),
        ),
      );
    } else {
      HapticFeedback.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 20),

                // Login Text
                Center(
                  child: Text(
                    'Customer Login ',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 const SizedBox(height: 25),
                Center(child: Image.asset(Constants.loginPath, height: 200, width: 200)),
                //  const SizedBox(height: 90),
                const SizedBox(height: 40),

                // Email Field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email' , 
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your email'  : null,
                ),
                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your password' : null,
                ),
                const SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: loginWithEmail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // OR Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 25),

                // Google Sign In Button
                const SignInGoogleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
