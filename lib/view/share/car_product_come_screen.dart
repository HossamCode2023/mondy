import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

import '../../component/button.dart';
import '../../component/input_text_button.dart';
import '../../component/text_field_input.dart';
import '../../controller/controllers.dart';
import '../../functions/alert.dart';
import '../../functions/function_share.dart';
import '../../functions/validation.dart';
import '../../theme/app_theme.dart';

class CarProductCome extends StatefulWidget {
  const CarProductCome({super.key});

  @override
  State<CarProductCome> createState() => _CarProductComeState();
}

class _CarProductComeState extends State<CarProductCome> {
  @override
  Widget build(BuildContext context) {
         final widthScreen = MediaQuery.of(context).size.width;
        
    return Scaffold(
      appBar: AppBar(title: 
      const Center(
        child: Text(' تقرير وصول عربة المنتج',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                const SizedBox(height: 10,),
                Row(
                  children: [
InputTextField(
                  color: Colors.black,
                  title: 'كود العربة',
                  textInputType: TextInputType.name,
                  textEditingController: shareController.carCode,
                  validation: validateInputNumber,
                  width: widthScreen/2 -30,
                ),
              const SizedBox(width: 10,),
                 InputTextField(
width: widthScreen/2 -30,

                  color: Colors.black,
                  title: 'رقم الإخطار',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.numCarRequest,
                  validation: validateInputNumber,
                ),
                  ],
                ),
const SizedBox(height: 10,),
                Row(
                  children: [
InputTextField(
                  color: Colors.red,
                  title: 'كمية ثابتة 95',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.const95,
                  validation: validateInputNumber,
                  width: widthScreen/2 -30,
                ),
              const SizedBox(width: 10,),
                 InputTextField(
width: widthScreen/2 -30,

                  color: Colors.red,
                  title: 'كمية عادية 95',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.normal95,
                  validation: validateInputNumber,
                ),
                  ],
                ),

                 const SizedBox(height: 10,),
                Row(
                  children: [
InputTextField(
                  color: Colors.blue,
                  title: 'كمية ثابتة 92',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.const92,
                  validation: validateInputNumber,
                  width: widthScreen/2 -30,
                ),
              const SizedBox(width: 10,),
                 InputTextField(
width: widthScreen/2 -30,

                  color: Colors.blue,
                  title: 'كمية عادية 92',
                  textInputType: TextInputType.number,
                  textEditingController: shareController.normal92,
                  validation: validateInputNumber,
                ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    InputTextField(
                      color: Colors.black,
                      title: 'إسم السائق',
                      textInputType: TextInputType.name,
                      textEditingController: shareController.carDriverName,
                      validation: validateInputName,
              width: widthScreen/2 -30,
                    ),        
                             const SizedBox(width: 10,),InputTextField(
                      color: Colors.black,
                      title: 'المستودع ',
                      textInputType: TextInputType.name,
                      textEditingController: shareController.storehouse,
                      validation: validateInputName,
                 width: widthScreen/2 -30,
                    ),  



                  ],
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
      height: 540,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Container(
                  height: 40,
                  width: widthScreen,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.amber
                  ),
                  child: const Center(child: Text('تقرير وصول عربة المنتج',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
          Container(
                  height: 40,
                  width: widthScreen,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.green
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
                documents[0]['stationName'].toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
                  width: widthScreen * 3/4 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:   Center(child: Text(shareController.carCode.text,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/4,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('كود العربة',
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
                  width: widthScreen * 3/4 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:   Center(child: Text(shareController.numCarRequest.text,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/4,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text(' رقم الإخطار',
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
                  child:  Center(child: Text(shareController.storehouse.text,
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
                  child: const Center(child: Text(' المستودع',
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
                  child: const Center(child: Text('تاريخ الإخطار',
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
                  width: widthScreen * 3/4 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:   Center(child: Text(shareController.carDriverName.text,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/4,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text(' إسم السائق',
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
                  width: widthScreen * 3/4 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:   StreamBuilder(
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
                  width: widthScreen * 1/4,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text(' المستلم',
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
                  child: const Center(child: Text('سعت الوصول',
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
                    color: Colors.blue
                  ),
                  child: const Center(child: Text('بنزين 92',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.red
                  ),
                  child: const Center(child: Text('بنزين 95',
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
                    color: Colors.blue
                  ),
                         child: const Center(child: Text('الكميةالعادية ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.blue
                  ),
               child: const Center(child: Text('الكمية الثابتة',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
               Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.red
                  ),
                  child: const Center(child: Text('الكميةالعادية',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.red
                  ),
                  child: const Center(child: Text('الكمية الثابتة',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
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
                         child:  Center(child: Text(shareController.normal92.text.toString(),
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
               child:  Center(child: Text(shareController.const92.text.toString(),
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
               Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 2/3 ,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:  Center(child: Text(shareController.normal95.text.toString(),
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: widthScreen * 1/3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                 
                  ),
                  child:  Center(child: Text(shareController.const95.text.toString(),
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Container(
                  height: 40,
                  width: widthScreen,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.yellow
                  ),
                  child: const Center(child: Text('تم وصول عربة المنتج وتم الإستعلام وجارى التفريغ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                ),
        ],
      ),
    );
  }
}