// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously, unused_element

// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/component/button.dart';
import 'package:chil_out/component/input_text_button.dart';
import 'package:chil_out/component/text_field_input.dart';
import 'package:chil_out/controller/controllers.dart';
import 'package:chil_out/functions/validation.dart';
import 'package:chil_out/view/auth/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../functions/alert.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // for error of keyboard....
      body: isLoading == false
          ? SafeArea(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const Text(
                      'Sign in to continue!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    InputTextField(
                      textInputType: TextInputType.name,
                      title: 'Email',
                      textEditingController: emailController,
                      validation: validateEmail,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputTextField(
                      textInputType: TextInputType.name,
                      title: 'Password',
                      obsecureText: true,
                      textEditingController: passwordController,
                      validation: validatePassword,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (emailController.text == "") {
                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Error!',
                                  message: 'Please insert your email!',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                              return;
                            }
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: emailController.text.trim());

                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Alert!',
                                  message:
                                      'Please go to your email and put new password!',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.warning,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            } catch (e) {
                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Error!',
                                  message: 'Please insert correct email',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            'Forgot Password!',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InputTextButton(
                      color: Theme.of(context).primaryColor,
                      onClick: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            isLoading = true;
                            setState(() {});
                            
                    
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                                    // authController.setUsers(context);
                            isLoading = false;
                            setState(() {});
                            //! Alert =========================
                              alert(
                                 
                                  context: context,
                                  title: 'Welcome!',
                                  message: 'To your App Happy day!',
                                  contentType: ContentType.success);

                              setState(() {
                                //! Alert =========================
                    // AwesomeDialog(
                    //   context: context,
                    //   dialogType: DialogType.WARNING,
                    //   animType: AnimType.RIGHSLIDE,
                    //   title: 'QUESTION!',
                    //   desc: 'Choice your title jop?',
                    //   btnCancelText: 'Manager',
                    //   btnCancelOnPress: ()  {
                    //   authController.titleJop = 'Manager';
                    //   authController.update();
                    //   print("========================${authController.titleJop}");
                    //   authController.setUsers(context);
                    //   },
                    //   btnOkText: 'Deputy',
                    //   btnOkOnPress: () {
                    //     authController.getDeputyNow(context);
                    //   // authController.setUsers(context);
                    //   },
                    //   autoHide: const Duration(seconds: 120)
                    // ).show();
                                Get.offAllNamed('/choiceManager');
                              });
                          } on FirebaseAuthException catch (e) {
                            isLoading = false;
                            setState(() {});
                            if (e.code == 'user-not-found') {
                              //! Alert =========================
                              alert(
                                 
                                  context: context,
                                  title: 'Error!',
                                  message: 'No user found for that email.',
                                  contentType: ContentType.failure);

                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              //! Alert =========================
                              alert(
                                 
                                  context: context,
                                  title: 'Error!',
                                  message:
                                      'Wrong password provided for that user.',
                                  contentType: ContentType.failure);

                              print('Wrong password provided for that user.');
                            }
                          }
                        }
                      },
                      title: 'Sign In',
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                            '-------------------  OR  --------------------')),
                    const SizedBox(
                      height: 10,
                    ),
                    InputTextButton(
                      color: Colors.red,
                      onClick: () {
                        authController.signInWithGoogle();
                      },
                      title: 'Sign With Google',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputOutlineButton(
                        onClick: () {
                          Get.back();
                        },
                        title: 'Back'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('I\'m new user, '),
                        InkWell(
                            onTap: () {
                              Get.off(() => const SignUpScreen());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ))
          : Center(
              child: Lottie.asset('assets/lottie/animation_lmbpkfm2.json')),
    );
  }
}
