// ignore_for_file: avoid_print, unused_local_variable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jiffy/jiffy.dart';

import '../functions/alert.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  TextEditingController stationName = TextEditingController();
  TextEditingController managerName = TextEditingController();
  TextEditingController deputyName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController managerPhone = TextEditingController();
  TextEditingController deputyPhone = TextEditingController();

  void signInFirebase(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    Get.toNamed('/home');
  }

String time = Jiffy.now().format(pattern: 'd/M/yyyy   h:mm a').toString();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
 
  String managerNow = '';
  String phoneNow = '';
  String titleJop = '';

  getManagerNow(BuildContext context){
    titleJop = 'Manager';
    managerNow = managerName.text;
    phoneNow = managerPhone.text;
    update();
    print('======================titleJop :$titleJop');
    print('======================managerNow :$managerNow');
    print('======================phoneNow :$phoneNow');
    setUsers(context);
  }

  getDeputyNow(BuildContext context){
    titleJop = 'Deputy Manager';
    managerNow = deputyName.text;
    phoneNow = deputyPhone.text;
    update();
    setUsers(context);
  }
//*==== Function to add data to Firebass ==========================================

  Future<void> setUsers(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return users.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'stationName': stationName.text,
      'email': email.text,
      'managerName': managerName.text,
      'deputyName': deputyName.text,
      'managerNow': managerNow,
      'phoneNow': phoneNow,
      'titleJop': titleJop,
      'password': password.text,
      'dateTime': time,
      'managerPhone': managerPhone.text,
      'deputyPhone': deputyPhone.text,
      'id': FirebaseAuth.instance.currentUser!
          .uid, //* ========= to save for user ===============
    },SetOptions(merge: true)).then((value) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Success!',
          message: 'Your data saved ',
          contentType: ContentType.success);
         
          update();
    }).catchError((error) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Error!',
          message: '$error',
          contentType: ContentType.failure);
    });
  }
// List<QueryDocumentSnapshot> dataUsers = [];

//   bool isLoading = true;
//   getData() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     dataUsers.addAll(querySnapshot.docs);
//     isLoading = false;
//    update();
//   }
// @override
//   void onInit() {
//     getData();
//     print(dataUsers);
//     super.onInit();
//   }
}
