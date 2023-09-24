// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/route/app_route.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../component/input_text_button.dart';
import '../../component/text_field_input.dart';
import '../../constants/display_name.dart';
import '../../controller/controllers.dart';
import '../../functions/alert.dart';
import '../../functions/validation.dart';
import '../../widget/custom_text.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.asset("assets/icons/logo.png"),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text("Login",
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: [
                      CustomText(
                        text: "Welcome back to the admin panel.",
                        color: AppTheme.lightGrey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value){}),
                          const CustomText(text: "Remeber Me",),
                        ],
                      ),
                    
                       CustomText(
                        text: "Forgot password?",
                        color: AppTheme.active
                      )
                    ],
                  ),
                    const SizedBox(
                    height: 15,
                  ),
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
                              isLoading = false;
                              setState(() {});
                               //! Alert =========================
                                alert(
                                   
                                    context: context,
                                    title: 'Welcome!',
                                    message: 'Admin to your App Happy day!',
                                    contentType: ContentType.success);
            
                                setState(() {
                                  Get.offNamed(AppRoute.siteLayout);
                      menuController.changeActiveItemTo(overviewPageDisplayName);
                                });
                              // Get.toNamed('/dashboard');
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
                  // InkWell(
                  //   onTap: (){
                  //     Get.offNamed(AppRoute.siteLayout);
                  //     menuController.changeActiveItemTo(overviewPageDisplayName);
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(color: AppTheme.active, 
                  //     borderRadius: BorderRadius.circular(20)),
                  //     alignment: Alignment.center,
                  //     width: double.maxFinite,
                  //     padding: const EdgeInsets.symmetric(vertical: 16),
                  //     child: const CustomText(
                  //       text: "Login",
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                    
                   const SizedBox(
                    height: 15,
                  ),
                    
                  RichText(text:  TextSpan(
                    children: [
                      const TextSpan(text: "Do not have admin credentials? "),
                      TextSpan(text: "Request Credentials! ", style: TextStyle(color: AppTheme.active))
                    ]
                  ))
                    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
