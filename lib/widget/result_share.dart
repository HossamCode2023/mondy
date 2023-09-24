// ignore_for_file: unnecessary_string_interpolations

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/home_controller.dart';

class ResultShare extends StatefulWidget {
  const ResultShare({super.key});

  @override
  State<ResultShare> createState() => _ResultShareState();
}

class _ResultShareState extends State<ResultShare> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // padding: const EdgeInsets.only(left: 5),
          height: 750,
          width: 350,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.red.shade300, border: Border.all()),
                child: Center(
                    child: Text('${homeController.time.toString()}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                        color: const Color(0xffff8900), border: Border.all()),
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
                        color: const Color(0xffff8900), border: Border.all()),
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
                        color: const Color(0xffff8900), border: Border.all()),
                    child: const Center(
                        child: Text('البيان',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ),
                ],
              ),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.red.shade300, border: Border.all()),
                        child: Center(
                            child: Text(
                          homeController.petrol95Value.value.toString(),
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
                            color: Colors.red.shade300, border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.gunPetrol95.value.toString(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.red.shade300, border: Border.all()),
                        child: const Center(
                            child: Text('بنزين 95',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade300, border: Border.all()),
                        child: Center(
                            child: Text(
                          homeController.petrol92Value.value.toString(),
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
                            color: Colors.blue.shade300, border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.gunPetrol92.value.toString(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade300, border: Border.all()),
                        child: const Center(
                            child: Text('بنزين 92',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                          homeController.gunPetrolTotalPrice.value.toString(),
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
                                homeController.gunPetrolTotalLiters.value
                                    .toString(),
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
                  )),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(
                        child: Obx(() => Text(homeController.nameShif.value,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)))),
                  ),
                  Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.yellow, border: Border.all()),
                    child: const Center(
                        child: Text('رئيس الوردية',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ),
                ],
              ),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.numWorkers.value.toString(),
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.workersOwed.value.toString(),
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
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.visaTotal.round().toString(),
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
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.companyWorkers.value
                                    .round()
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
                            child: Text('شركة العمال',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.percent_30.value
                                    .round()
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
                            child: Text(' 30%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.office.value.round().toString(),
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
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.companyTotal.value
                                    .round()
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
                            child: Text('إجمالى الشركة',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.shiftCheif.value
                                    .round()
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
                            child: Text(' مع رئيس الوردية',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.bank.value.round().toString(),
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
                  )),
              Obx(() => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: Text(
                                homeController.support.value.round().toString(),
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
                  )),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            alert(
                context: context,
                title: 'Error!',
                message: '${snapshot.error}',
                contentType: ContentType.failure);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Lottie.asset(
              'assets/lottie/animation_lmbpkfm2.json',
            ));
          }
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
         
          return  Center(
            child: Text(
                documents[0]['managerName'].toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
          );
        },
      )
                                    ),
                      ),
                      Container(
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.yellow, border: Border.all()),
                        child: const Center(
                            child: Text('توقيع',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  ), Row(
                    children: [
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                            child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            alert(
                context: context,
                title: 'Error!',
                message: '${snapshot.error}',
                contentType: ContentType.failure);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Lottie.asset(
              'assets/lottie/animation_lmbpkfm2.json',
            ));
          }
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
         
          return  Center(
            child: Text(
                documents[0]['stationName'].toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
          );
        },
      )
                                    ),
                      ),
                      Container(
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.yellow, border: Border.all()),
                        child: const Center(
                            child: Text('إسم المحطة',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ),
                    ],
                  )
            ],
          )),
    );
  }
}
