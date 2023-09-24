// ignore_for_file: unused_local_variable, avoid_print

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/component/button.dart';
import 'package:chil_out/component/input_text_button.dart';
import 'package:chil_out/controller/controllers.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

import '../../component/text_field_input.dart';
import '../../functions/alert.dart';
import '../../functions/function_share.dart';
import '../../functions/validation.dart';

class AllBlankesScreen extends StatefulWidget {
  const AllBlankesScreen({super.key});

  @override
  State<AllBlankesScreen> createState() => _AllBlankesScreenState();
}

class _AllBlankesScreenState extends State<AllBlankesScreen> {
  List<QueryDocumentSnapshot> data = [];

  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('assets')
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
  void dispose() {
   shareController.assets95Controller;
   shareController.assets92Controller;
   shareController.sales95Controller;
   shareController.sales92Controller;
   shareController.malfunctionsController;

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
         final widthScreen = MediaQuery.of(context).size.width;
        
    return Scaffold(
      appBar: AppBar(title: 
      const Center(
        child: Text('تمام الفراغات والموجودات والم',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                const SizedBox(height: 20,),
                Row(
                  children: [
InputTextField(
                  color: Colors.red,
                  title: 'موجودات بنزين 95',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.assets95Controller,
                  validation: validateInputNumber,
                  width: widthScreen/2 -30,
                ),
              const SizedBox(width: 10,),
                 InputTextField(
width: widthScreen/2 -30,

                  color: Colors.blue,
                  title: 'موجودات بنزين 92',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.assets92Controller,
                  validation: validateInputNumber,
                ),
                  ],
                ),

                 
                const SizedBox(height: 10,),
                 Row(
                  children: [
InputTextField(
                  color: Colors.red,
                  title: 'مبيعات بنزين 95',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.sales95Controller,
                  validation: validateInputNumber,
                  width: widthScreen/2 -30,
                ),
              const SizedBox(width: 10,),
                 InputTextField(
width: widthScreen/2 -30,

                  color: Colors.blue,
                  title: 'مبيعات بنزين 92',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.sales92Controller,
                  validation: validateInputNumber,
                ),
                  ],
                ),
                 InputTextField(
                  
                  color: Colors.black,
                  title: 'الاعطال  ',
                  textInputType: TextInputType.name,
                  textEditingController: shareController.malfunctionsController,
                  validation: validateInputName,
                ),
                 BuildWidget(
                  widthScreen: widthScreen,
                 ),
                          const SizedBox(height: 20,),

                InputOutlineButton(
                  title: 'إختبار',
                  onClick: (){
                    setState(() {
                      shareController.calBlanks();
                      shareController.getStationAndmanagerName();
                    });
                  },
                ),
                const SizedBox(height: 20,),
                InputTextButton(
                  title: 'مشاركة',
                  onClick: (){
                      shareScreenShot(
                  context: context,
                  shareWidget:  BuildWidget(
                    widthScreen: widthScreen,

                  )
                 );
                  },
                  color: AppTheme.active,
                ),
                const SizedBox(height: 20,),
                InputTextButton(
                  title: 'حفظ',
                  onClick: (){
                     if (data.isNotEmpty) {
                  shareController.deleteAssets(context,data[0].id);

                  }
                  shareController.addAssets(context);
                  setState(() {
                     Get.toNamed("/dashboard");


                  });
                  },
                  color: AppTheme.lightPrimaryColor,
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
    super.key, required this.widthScreen,
  });

  @override
  Widget build(BuildContext context) {
   

    return Container(
      width: widthScreen,
      height: 400,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Container(
                  height: 40,
                  width: widthScreen,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.green
                  ),
                  child:  Center(child: StreamBuilder(
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
         
          return  Text(
              documents[0]['stationName'].toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            );
        },
      ),
                  ),
                ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.blue
                  ),
                  child: const Center(child: Text('بنزين 92',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.red
                  ),
                  child: const Center(child: Text('بنزين 95',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('البيان',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:  Center(child: Text(shareController.assets92Controller.text.toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:  Center(child: Text(shareController.assets95Controller.text.toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('الموجودات ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                 
                  ),
                  child:  Center(child: Text(shareController.blanks92.value.toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  
                  ),
                  child:  Center(child: Text(shareController.blanks95.value.toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('الفراغات ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black))),
                ),
              ),
            ],
          ),
           Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                 
                  ),
                  child:  Center(child: Text(shareController.sales92Controller.text.toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  
                  ),
                  child:  Center(child: Text(shareController.sales95Controller.text.toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('المبيعات ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black))),
                ),
              ),
            ],
          ),
           Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:   Center(child: Text(shareController.malfunctionsController.text,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('الأعطال',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
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
                  width: widthScreen * 2/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:  Center(child: Text(Jiffy.now().format(pattern: 'd/M/yyyy').toString(),
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('التاريخ',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
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
                  width: widthScreen * 2/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:  Center(child: Text(Jiffy.now().format(pattern: 'h:mm a').toString(),
                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('التوقيت',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
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
                  width: widthScreen * 2/3 ,
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
      ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('التوقيع',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
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