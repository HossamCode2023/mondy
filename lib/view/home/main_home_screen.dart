// ignore_for_file: unnecessary_string_interpolations, sort_child_properties_last, avoid_print

import 'package:chil_out/component/input_text_button.dart';
import 'package:chil_out/controller/home_controller.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/button.dart';
import '../../component/text_field_input.dart';
import '../../functions/validation.dart';
import '../../widget/result_share.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  @override
  void dispose() {
   homeController.visaTotalController;
   homeController.nameShifController;
    super.dispose();
  }
  final homeController = Get.find<HomeController>();
  List<QueryDocumentSnapshot> data = [];

  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('shift')
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
    final widthScreen = MediaQuery.of(context).size.width;
    return   Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
             
              Center(
                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(homeController.selectNumOffWorkers != null) Text('عدد العمال =  ${homeController.selectNumOffWorkers} ',
                           style: const TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.red),),
                             Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                  Container(
                    color: Colors.amber[900],
                    // padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(fontSize: 16),
                        focusColor: Colors.red,
                        dropdownColor: Colors.amber[900],
                        alignment: Alignment.center,
                        hint: const Text('إختار عدد العمال',style: TextStyle(color: Colors.white),),
                        items: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
                        .map((e) => DropdownMenuItem(
                          child: Center(child: Text(' $e')),
                          value: e,
                          ))
                        .toList(),
                        onChanged: (val) {
                          setState(() {
                            homeController.selectNumOffWorkers = val;
                          });
                        },
                        value: homeController.selectNumOffWorkers,
                      ),
                    ),
                  ),
                             ],
                           ),
                  ],
                             ),
               ),
               const SizedBox(height: 10,),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                InputTextField(
                  textEditingController: homeController.visaTotalController,
                    width: widthScreen / 3,
                  color: Colors.black,
                  title: 'إجمالى الفيزا',
                  validation: validateInputNumber,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(width: 10,),
                InputTextField(
                
                    color: Colors.black,
                    title: ' رئيس الوردية',
                    textInputType: TextInputType.name,
                    textEditingController: homeController.nameShifController,
                    validation: validateInputName,
                    width: widthScreen / 3,
                  ),
               ]),
                const ResultShare(),
               const SizedBox(height: 10,),
              InputTextButton(
                color: const Color(0xffff8900),
                onClick: (){
                  Get.back();
                },
                title: 'العودة للخلف',
              ),
               const SizedBox(height: 10,),
              InputOutlineButton(
                onClick: (){
                  setState(() {
                    homeController.update();
                    homeController.calNameShif();
                    homeController.calculateSum();
                    homeController.calNumWorkers();
                    homeController.calWorkersOwed();
                    homeController.calCompWorkers();
                    homeController.calVisa();
                    homeController.calPercent_30();
                    homeController.calOffice();
                    homeController.calComTotal();
                    homeController.calShiftCheif();
                    homeController.calBank();
                    homeController.calSupport();
                  });
                },
                title: 'اختبار ',
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextButton(
                title: 'حفظ',
                onClick: () {
                 homeController.setShift(context,data[0].id);
                  // if (data.isNotEmpty) {
                  // homeController.deleteShift(context,data[0].id);

                  // }
                  // homeController.addShift(context);
                  setState(() {
                     Get.toNamed("/dashboard");


                  });
                },
                color: AppTheme.active,
              ),
            ],
          ),
        ),
      ),
    );
  }
}