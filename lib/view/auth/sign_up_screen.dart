// ignore_for_file: unused_field, unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/component/button.dart';
import 'package:chil_out/component/input_text_button.dart';
import 'package:chil_out/component/text_field_input.dart';
import 'package:chil_out/controller/controllers.dart';
import 'package:chil_out/functions/validation.dart';
import 'package:chil_out/view/auth/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../functions/alert.dart';
List<QueryDocumentSnapshot> data = [];
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        data = [];
        print('====================== User is currently signed out!');
      } else {
        getData();
        print('=============================== data list :$data');
        print('======================= User is signed in!');
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final authController = Get.put(AuthController);

    return Scaffold(
      resizeToAvoidBottomInset: false, // for error of keyboard....
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const Text(
                    'Sign up to started!',
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
                    color: Colors.black,
                    title: 'Station Name',
                    textEditingController: authController.stationName,
                    validation: validateInputName,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.name,
                    color: Colors.black,
                    title: 'Manager Name',
                    textEditingController: authController.managerName,
                    validation: validateInputName,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.phone,
                    color: Colors.black,
                    title: 'Manager phone',
                    textEditingController: authController.managerPhone,
                    validation: validateInputNumber,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.name,
                    color: Colors.black,
                    title: 'Deputy Name',
                    textEditingController: authController.deputyName,
                    validation: validateInputName,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.phone,
                    color: Colors.black,
                    title: 'Deputy Phone',
                    textEditingController: authController.deputyPhone,
                    validation: validateInputNumber,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.name,
                    color: Colors.black,
                    title: 'Email',
                    textEditingController: authController.email,
                    validation: validateEmail,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.name,
                    color: Colors.black,
                    title: 'Password',
                    obsecureText: true,
                    textEditingController: authController.password,
                    validation: validatePassword,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  InputTextField(
                    textInputType: TextInputType.name,
                    color: Colors.black,
                    title: 'Confirm Password',
                    obsecureText: true,
                    textEditingController: authController.confirmPassword,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      } else if (authController.password.text != value) {
                        return "Confirm password not match";
                      }
                      return null;
                    },
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  const Spacer(),
                  InputTextButton(
                    color: Theme.of(context).primaryColor,
                    onClick: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              
                            email: authController.email.text,
                            password: authController.password.text,
                          );
                          authController.setUsers(context);
                          Get.offAllNamed('/signIn');
                          
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            //! Alert =========================
                            alert(
                               
                                context: context,
                                title: 'Error!',
                                message: 'The password provided is too weak.',
                                contentType: ContentType.warning);

                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            //! Alert =========================
                            alert(
                               
                                context: context,
                                title: 'Error!',
                                message:
                                    'The account already exists for that email.',
                                contentType: ContentType.warning);

                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    title: 'Sign Up',
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  InputOutlineButton(
                      onClick: () {
                        Get.back();
                      },
                      title: 'Back'),
                  const SizedBox(
                    height: 2,
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('I\'m already a member, '),
                      InkWell(
                          onTap: () {
                            Get.off(() => const SignInScreen());
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
        ),
      ));
    
  }
}
