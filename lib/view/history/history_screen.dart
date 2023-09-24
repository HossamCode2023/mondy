// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, unused_local_variable, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chil_out/controller/controllers.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<QueryDocumentSnapshot> data = [];

  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('shift')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    DocumentReference documentReference = FirebaseFirestore.instance
  .collection('shift')
  .doc(data[0].id);
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
        body: isLoading == true
            ? Center(
                child: Lottie.asset(
                'assets/lottie/animation_lmbpkfm2.json',
              ))
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => InkWell(
                  onLongPress: () {
                    //! Alert =========================
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.RIGHSLIDE,
                      title: 'Warning!',
                      desc: 'You will delete your data!',
                      btnCancelText: 'Delete',
                      btnCancelOnPress: () async {
                        //* ============ Function to delete ====================
                        homeController.deleteShift(context, data[index].id);

                        setState(() {
                          Get.offAndToNamed("/dashboard");
                        });
                      },
                      // btnOkText: 'Update',
                      // btnOkOnPress: () {
                      //   Get.to(() => EditShiftScreen(
                      //         docid: data[index].id,
                      //         OldGunPetrolTotalPrice: data[index]
                      //             ['gunPetrolTotalPrice'],
                      //         OldVisaTotal: data[index]['visaTotal'],
                      //         OldNameShif: data[index]['nameShif'],
                      //       ));
                      // },
                    ).show();
                  },
                  child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 680,
                      width: 350,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                border: Border.all()),
                            child: Center(
                                child: Text('${data[index]['dateTime']}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: const Color(0xffff8900),
                                    border: Border.all()),
                                child: const Center(
                                    child: Text(
                                  'القيمة النقدية',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                              ),
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: const Color(0xffff8900),
                                    border: Border.all()),
                                child: const Center(
                                    child: Text('اللترات',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: const Color(0xffff8900),
                                    border: Border.all()),
                                child: const Center(
                                    child: Text('البيان',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade300,
                                    border: Border.all()),
                                child: Center(
                                    child: Text(
                                  '${data[index]['petrol95Value']}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                              ),
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade300,
                                    border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['gunPetrol95']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                              ),
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade300,
                                    border: Border.all()),
                                child: const Center(
                                    child: Text('بنزين 95',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade300,
                                    border: Border.all()),
                                child: Center(
                                    child: Text(
                                  '${data[index]['petrol92Value']}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                              ),
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade300,
                                    border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['gunPetrol92']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade300,
                                    border: Border.all()),
                                child: const Center(
                                    child: Text('بنزين 92',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text(
                                  '${data[index]['gunPetrolTotalPrice']}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                              ),
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text(
                                        '${data[index]['gunPetrolTotalLiters']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('الإجمالى',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text(
                                        '${data[index]['nameShif']}'.toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('رئيس الوردية',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text(
                                        '${data[index]['numWorkers']}'
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('عدد العمال',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['workersOwed']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('مستحق العمال',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['visaTotal']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('إجمالى الفيزا',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text(
                                        '${data[index]['companyWorkers']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('شركة العمال',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['percent_30']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text(' 30%',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['office']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('المكتب',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text(
                                        '${data[index]['companyTotal']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('إجمالى الشركة',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['shiftCheif']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text(' مع رئيس الوردية',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['bank']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('البنك',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Center(
                                    child: Text('${data[index]['support']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.yellow, border: Border.all()),
                                child: const Center(
                                    child: Text('الدعم',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ));
  }
}
