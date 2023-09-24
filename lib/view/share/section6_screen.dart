import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/component/button.dart';
import 'package:chil_out/component/input_text_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

import '../../component/text_field_input.dart';
import '../../controller/controllers.dart';
import '../../functions/alert.dart';
import '../../functions/function_share.dart';
import '../../theme/app_theme.dart';

class Section6Screen extends StatefulWidget {
  const Section6Screen({super.key});

  @override
  State<Section6Screen> createState() => _Section6ScreenState();
}

class _Section6ScreenState extends State<Section6Screen> {
  @override
  void dispose() {
    shareController.numOfWorkerController;
    shareController.comController;
    shareController.winController;
    shareController.saleController;
    shareController.petrol95Controller;
    shareController.petrol92Controller;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'تمام القطاع السادس الصباحى',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                color: Colors.black,
                title: 'عدد العمال ',
                textInputType: TextInputType.number,
                textEditingController: shareController.numOfWorkerController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTextField(
                    width: widthScreen / 4,
                    color: Colors.black,
                    title: ' الشركة',
                    textInputType: TextInputType.number,
                    textEditingController: shareController.comController,
                  ),
                  InputTextField(
                    width: widthScreen / 4,
                    color: Colors.black,
                    title: ' الربح',
                    textInputType: TextInputType.number,
                    textEditingController: shareController.winController,
                  ),
                  InputTextField(
                    width: widthScreen / 4,
                    color: Colors.black,
                    title: ' المباع',
                    textInputType: TextInputType.number,
                    textEditingController: shareController.saleController,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTextField(
                    width: widthScreen / 3,
                    color: Colors.blue,
                    title: ' بنزين 92 منتج',
                    textInputType: TextInputType.number,
                    textEditingController: shareController.petrol95Controller,
                  ),
                  InputTextField(
                    width: widthScreen / 3,
                    color: Colors.red,
                    title: ' بنزين 95 منتج',
                    textInputType: TextInputType.number,
                    textEditingController: shareController.petrol92Controller,
                  ),
                ],
              ),
              BuildWidget(
                widthScreen: widthScreen,
              ),
              const SizedBox(
                height: 10,
              ),
              InputOutlineButton(
                title: 'إختبار',
                onClick: () {
                  setState(() {
                    shareController.calBlanks();
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextButton(
                title: 'مشاركة',
                onClick: () {
                  shareScreenShot(
                      context: context,
                      shareWidget: BuildWidget(
                        widthScreen: widthScreen,
                      ));
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

class BuildWidget extends StatelessWidget {
  final double widthScreen;
  const BuildWidget({
    super.key,
    required this.widthScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthScreen,
      height: 740 ,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          Container(
            height: 40,
            width: widthScreen,
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.green),
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
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
          );
        },
      )
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.blue),
                  child: const Center(
                      child: Text(
                    'بنزين 92',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.red),
                  child: const Center(
                    child: Text('بنزين 95',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                      child: Text('البيان',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.assets92Controller.text.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(
                        shareController.assets95Controller.text.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                      child: Text('الموجودات بالاف',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.blanks92.value.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(shareController.blanks95.value.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                      child: Text('الفراغات بالاف',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.sales92Controller.text.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(
                        shareController.sales95Controller.text.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                      child: Text('المبيعات ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2 / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.malfunctionsController.text,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1 / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                    child: Text('الأعطال',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2 / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.numOfWorkerController.text,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1 / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                    child: Text('عدد العمال ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: widthScreen,
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.green),
            child: const Center(
              child: Text('المنتجات',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: const Center(
                      child: Text(
                    ' الشركة',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: const Center(
                    child: Text('الربح',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: const Center(
                      child: Text('المباع',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.comController.text.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(shareController.winController.text.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(shareController.saleController.text.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: widthScreen,
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.orange),
            child: const Center(
              child: Text('عربة المنتج',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 2,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.blue),
                  child: const Center(
                      child: Text(
                    'بنزين 92',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 2,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.red),
                  child: const Center(
                    child: Text('بنزين 95',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 2,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    shareController.petrol95Controller.text.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen / 2,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(
                        shareController.petrol92Controller.text.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2 / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    Jiffy.now().format(pattern: 'd/M/yyyy').toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1 / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                    child: Text('التاريخ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2 / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                      child: Text(
                    Jiffy.now().format(pattern: 'h:mm a').toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1 / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                    child: Text('التوقيت',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2 / 3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
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
                documents[0]['managerNow'].toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
          );
        },
      )
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1 / 3,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.yellow),
                  child: const Center(
                    child: Text('التوقيع',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
