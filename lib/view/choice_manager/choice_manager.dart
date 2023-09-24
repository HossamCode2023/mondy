// ignore_for_file: avoid_print, unused_element

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../functions/alert.dart';
import '../../route/app_route.dart';
import '../../theme/app_theme.dart';
import '../../widget/elevatedButtonUtils.dart';
import '../../widget/text_utils.dart';

class ChoiceManager extends StatefulWidget {
  const ChoiceManager({super.key});

  @override
  State<ChoiceManager> createState() => _ChoiceManagerState();
}

class _ChoiceManagerState extends State<ChoiceManager> {
  List<QueryDocumentSnapshot> data = [];

  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(data[0].id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);

      if (!snapshot.exists) {
        throw Exception("User does not exist!");
      }
    });
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/4957136.jpg'),
            TextUtils(
                              text: 'Please choice your title job!',
                              fontSize: 28.0,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.lightPrimaryColor,
                              decoration: TextDecoration.none,
                            ),
                            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButtonUtils(
                  onPressed: () {
                    String time = Jiffy.now()
                        .format(pattern: 'd/M/yyyy   h:mm a')
                        .toString();

                    CollectionReference users =
                        FirebaseFirestore.instance.collection('users');

                    users.doc(FirebaseAuth.instance.currentUser!.uid).update({
                      'stationName': data[0]['stationName'],
                      'email': data[0]['email'],
                      'managerName': data[0]['managerName'],
                      'deputyName': data[0]['deputyName'],
                      'managerNow': data[0]['deputyName'],
                      'phoneNow': data[0]['deputyPhone'],
                      'titleJop': 'Deputy',
                      'password': data[0]['password'],
                      'dateTime': time,
                      'managerPhone': data[0]['managerPhone'],
                      'deputyPhone': data[0]['deputyPhone'],
                      'id': FirebaseAuth.instance.currentUser!
                          .uid, //* ========= to save for user ===============
                    }).then((value) {
                      //! Alert =========================
                      alert(
                          context: context,
                          title: 'Success!',
                          message: 'Your data saved ',
                          contentType: ContentType.success);

                      setState(() {});
                    }).catchError((error) {
                      //! Alert =========================
                      alert(
                          context: context,
                          title: 'Error!',
                          message: '$error',
                          contentType: ContentType.failure);
                    });
                    Get.offNamed(AppRoute.dashboard);
                  },
                  color: AppTheme.light,
                  decoration: TextDecoration.none,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  text: 'Deputy',
                  paddingHerizontal: 40.0,
                  paddingVertical: 12.0,
                  primary: AppTheme.lightPrimaryColor,
                ),
                ElevatedButtonUtils(
                  onPressed: () {
                    String time = Jiffy.now()
                        .format(pattern: 'd/M/yyyy   h:mm a')
                        .toString();

                    CollectionReference users =
                        FirebaseFirestore.instance.collection('users');

                    users.doc(FirebaseAuth.instance.currentUser!.uid).update({
                      'stationName': data[0]['stationName'],
                      'email': data[0]['email'],
                      'managerName': data[0]['managerName'],
                      'deputyName': data[0]['deputyName'],
                      'managerNow': data[0]['managerName'],
                      'phoneNow': data[0]['managerPhone'],
                      'titleJop': 'Manager',
                      'password': data[0]['password'],
                      'dateTime': time,
                      'managerPhone': data[0]['managerPhone'],
                      'deputyPhone': data[0]['deputyPhone'],
                      'id': FirebaseAuth.instance.currentUser!
                          .uid, //* ========= to save for user ===============
                    }).then((value) {
                      //! Alert =========================
                      alert(
                          context: context,
                          title: 'Success!',
                          message: 'Your data saved ',
                          contentType: ContentType.success);

                      setState(() {});
                    }).catchError((error) {
                      //! Alert =========================
                      alert(
                          context: context,
                          title: 'Error!',
                          message: '$error',
                          contentType: ContentType.failure);
                    });
                    Get.offNamed(AppRoute.dashboard);
                  },
                  color: AppTheme.light,
                  decoration: TextDecoration.none,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  text: 'Manager',
                  paddingHerizontal: 40.0,
                  paddingVertical: 12.0,
                  primary: AppTheme.lightPrimaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
