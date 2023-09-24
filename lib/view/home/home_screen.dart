// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, sort_child_properties_last, unnecessary_null_comparison, unused_field, prefer_final_fields, unused_local_variable, avoid_print, avoid_unnecessary_containers

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/component/button.dart';
import 'package:chil_out/component/input_text_button.dart';
import 'package:chil_out/component/text_field_input.dart';
import 'package:chil_out/controller/home_controller.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:chil_out/functions/validation.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final homeController = Get.find<HomeController>();
  bool isVisible = true;
  var selectGun;

  final screenshotController = ScreenshotController();
  @override
  void dispose() {
    homeController.gun1OldMechController;
    homeController.gun1OldElecController;
    homeController.gun2OldMechController;
    homeController.gun2OldElecController;
    homeController.gun3OldMechController;
    homeController.gun3OldElecController;
    homeController.gun4OldMechController;
    homeController.gun4OldElecController;
    homeController.gun5OldMechController;
    homeController.gun5OldElecController;
    homeController.gun6OldMechController;
    homeController.gun6OldElecController;
    homeController.gun7OldMechController;
    homeController.gun7OldElecController;
    homeController.gun8OldMechController;
    homeController.gun8OldElecController;
    homeController.gun9OldMechController;
    homeController.gun9OldElecController;
    homeController.gun10OldMechController;
    homeController.gun10OldElecController;
    homeController.gun11OldMechController;
    homeController.gun11OldElecController;
    homeController.gun12OldMechController;
    homeController.gun12OldElecController;
    homeController.gun13OldMechController;
    homeController.gun13OldElecController;
    homeController.gun14OldMechController;
    homeController.gun14OldElecController;
    homeController.gun15OldMechController;
    homeController.gun15OldElecController;
    homeController.gun16OldMechController;
    homeController.gun16OldElecController;

    homeController.gun1NewMechController;
    homeController.gun1NewElecController;
    homeController.gun2NewMechController;
    homeController.gun2NewElecController;
    homeController.gun3NewMechController;
    homeController.gun3NewElecController;
    homeController.gun4NewMechController;
    homeController.gun4NewElecController;
    homeController.gun5NewMechController;
    homeController.gun5NewElecController;
    homeController.gun6NewMechController;
    homeController.gun6NewElecController;
    homeController.gun7NewMechController;
    homeController.gun7NewElecController;
    homeController.gun8NewMechController;
    homeController.gun8NewElecController;
    homeController.gun9NewMechController;
    homeController.gun9NewElecController;
    homeController.gun10NewMechController;
    homeController.gun10NewElecController;
    homeController.gun11NewMechController;
    homeController.gun11NewElecController;
    homeController.gun12NewMechController;
    homeController.gun12NewElecController;
    homeController.gun13NewMechController;
    homeController.gun13NewElecController;
    homeController.gun14NewMechController;
    homeController.gun14NewElecController;
    homeController.gun15NewMechController;
    homeController.gun15NewElecController;
    homeController.gun16NewMechController;
    homeController.gun16NewElecController;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Center(
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
         
          return  Text(
              documents[0]['stationName'].toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            );
        },
      ),
            ),
           
            
          ],
        ),
      ),









      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //===============================================================================================
             
              isVisible == true?  SizedBox(
                child: Column(
                  children: [
                     const Center(
                  child: Text(
                'أدخل القراءات السابقة',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
                      BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun1OldMechController,
                  textEditingOldElec: homeController.gun1OldElecController,
                  color: Colors.red,
                  number: '1'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun2OldMechController,
                  textEditingOldElec: homeController.gun2OldElecController,
                  color: Colors.blue,
                  number: '2'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun3OldMechController,
                  textEditingOldElec: homeController.gun3OldElecController,
                  color: Colors.red,
                  number: '3'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun4OldMechController,
                  textEditingOldElec: homeController.gun4OldElecController,
                  color: Colors.blue,
                  number: '4'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun5OldMechController,
                  textEditingOldElec: homeController.gun5OldElecController,
                  color: Colors.red,
                  number: '5'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun6OldMechController,
                  textEditingOldElec: homeController.gun6OldElecController,
                  color: Colors.blue,
                  number: '6'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun7OldMechController,
                  textEditingOldElec: homeController.gun7OldElecController,
                  color: Colors.red,
                  number: '7'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun8OldMechController,
                  textEditingOldElec: homeController.gun8OldElecController,
                  color: Colors.blue,
                  number: '8'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun9OldMechController,
                  textEditingOldElec: homeController.gun9OldElecController,
                  color: Colors.red,
                  number: '9'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun10OldMechController,
                  textEditingOldElec: homeController.gun10OldElecController,
                  color: Colors.blue,
                  number: '10'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun11OldMechController,
                  textEditingOldElec: homeController.gun11OldElecController,
                  color: Colors.red,
                  number: '11'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun12OldMechController,
                  textEditingOldElec: homeController.gun12OldElecController,
                  color: Colors.blue,
                  number: '12'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun13OldMechController,
                  textEditingOldElec: homeController.gun13OldElecController,
                  color: Colors.red,
                  number: '13'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun14OldMechController,
                  textEditingOldElec: homeController.gun14OldElecController,
                  color: Colors.blue,
                  number: '14'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun15OldMechController,
                  textEditingOldElec: homeController.gun15OldElecController,
                  color: Colors.red,
                  number: '15'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'بداية',
                  textEditingOldMech: homeController.gun16OldMechController,
                  textEditingOldElec: homeController.gun16OldElecController,
                  color: Colors.blue,
                  number: '16'),

               const Divider(),
              //====================================================================================================================
               const Center(
                  child: Text(
                'أدخل القراءات الحالية',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun1NewMechController,
                  textEditingOldElec: homeController.gun1NewElecController,
                  color: Colors.red,
                  number: '1'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun2NewMechController,
                  textEditingOldElec: homeController.gun2NewElecController,
                  color: Colors.blue,
                  number: '2'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun3NewMechController,
                  textEditingOldElec: homeController.gun3NewElecController,
                  color: Colors.red,
                  number: '3'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun4NewMechController,
                  textEditingOldElec: homeController.gun4NewElecController,
                  color: Colors.blue,
                  number: '4'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun5NewMechController,
                  textEditingOldElec: homeController.gun5NewElecController,
                  color: Colors.red,
                  number: '5'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun6NewMechController,
                  textEditingOldElec: homeController.gun6NewElecController,
                  color: Colors.blue,
                  number: '6'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun7NewMechController,
                  textEditingOldElec: homeController.gun7NewElecController,
                  color: Colors.red,
                  number: '7'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun8NewMechController,
                  textEditingOldElec: homeController.gun8NewElecController,
                  color: Colors.blue,
                  number: '8'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun9NewMechController,
                  textEditingOldElec: homeController.gun9NewElecController,
                  color: Colors.red,
                  number: '9'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun10NewMechController,
                  textEditingOldElec: homeController.gun10NewElecController,
                  color: Colors.blue,
                  number: '10'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun11NewMechController,
                  textEditingOldElec: homeController.gun11NewElecController,
                  color: Colors.red,
                  number: '11'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun12NewMechController,
                  textEditingOldElec: homeController.gun12NewElecController,
                  color: Colors.blue,
                  number: '12'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun13NewMechController,
                  textEditingOldElec: homeController.gun13NewElecController,
                  color: Colors.red,
                  number: '13'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun14NewMechController,
                  textEditingOldElec: homeController.gun14NewElecController,
                  color: Colors.blue,
                  number: '14'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun15NewMechController,
                  textEditingOldElec: homeController.gun15NewElecController,
                  color: Colors.red,
                  number: '15'),
              BuildRowWidget(
                  homeController: homeController,
                  time: 'نهاية',
                  textEditingOldMech: homeController.gun16NewMechController,
                  textEditingOldElec: homeController.gun16NewElecController,
                  color: Colors.blue,
                  number: '16'),
                  ],
                ),
              ) :const Text(''),
              
              //==================================================================
      
             
       

              

              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const Center(
                  child: Text(
                'أدخل  العيارات ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 20,
              ),
               Center(
                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(homeController.selectGun != null) Text('${homeController.selectGun}',
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
                        hint: const Text('إختار المسدس المطلوب',style: TextStyle(color: Colors.white),),
                        items: ['الجميع','مسدس1','مسدس2','مسدس3','مسدس4','مسدس5','مسدس6','مسدس7',
                        'مسدس8','مسدس9','مسدس10','مسدس11','مسدس11','مسدس12','مسدس13','مسدس14','مسدس15','لا يوجد']
                        .map((e) => DropdownMenuItem(
                          child: Center(child: Text('$e')),
                          value: e,
                          ))
                        .toList(),
                        onChanged: (val) {
                          setState(() {
                            homeController.selectGun = val;
                          });
                        },
                        value: homeController.selectGun,
                      ),
                    ),
                  ),
                             ],
                           ),
                  ],
                             ),
               ),
              
          
           const SizedBox(height: 20,),
              InputTextButton(
                color:const Color(0xffff8900) ,
                onClick: () {
                  homeController.gunDifference();
                  Get.toNamed('/showTest');
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                title: 'إختبار القيم',
              ),
              const SizedBox(height: 20,),
              InputOutlineButton(
              title: 'حفظ',
              onClick: ()async{
                    homeController.storeOldValue();

              },
             ),
              const SizedBox(height: 20,),
               InputTextButton(
                color:AppTheme.active ,
                onClick: () {
                 setState(() {
                    homeController.calculateSum();
                     Get.toNamed('/mainHome');

                  });

                  
               
                },
                title: 'التالى',
              ),
              
               
            ],
          ),
        ),
      )),
    );
  }
 
}



class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.homeController,
    required this.number,
    required this.gunElec,
    required this.gunMech,
    required this.gunDif,
    required this.gun, 
     required this.gasolineGauges, 
  });

  final HomeController homeController;
  final String number;
  final RxInt gunElec;
  final RxInt gunMech;
  final RxInt gunDif;
  final RxInt gun;
  final RxInt gasolineGauges;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    gasolineGauges.value.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              const Text(
                ': العيارات',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              ),
              Obx(() => Text(
                    '$gunElec',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              const Text(
                ': الكترونى',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              ),
              Obx(() => Text(
                    '$gunMech',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              const Text(
                ': الميكانيكى',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          // ignore: prefer_const_constructors
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                ' مسدس $number',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20,),
              CircleAvatar(
                maxRadius: 15,
                backgroundColor:
                    gunDif > -3 && gunDif < 3 ? Colors.yellow : Colors.red,
                child: Obx(
                  () => Text(gunDif.toString()),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Obx(() => Text(
                    '$gun',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )),
              const Text(
                ' :  الفعلى',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildRowWidget extends StatelessWidget {
  const BuildRowWidget({
    super.key,
    required this.homeController,
    required this.number,
    required this.color,
    required this.textEditingOldElec,
    required this.textEditingOldMech,
    required this.time,
  });

  final HomeController homeController;
  final String number, time;
  final Color color;
  final TextEditingController textEditingOldElec;
  final TextEditingController textEditingOldMech;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: InputTextField(
                  textInputType: TextInputType.number,
                    title: ' الكترونى ',
                    validation: validateInputNumber,
                    textEditingController: textEditingOldElec,
                    color: color)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InputTextField(
                              textInputType: TextInputType.number,

                title: ' ميكانيكى ',
                validation: validateInputNumber,
                color: color,
                textEditingController: textEditingOldMech,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
             Padding(
               padding: const EdgeInsets.only(bottom: 13),
               child: Center(child: Text('مسدس $number',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
             )
          ],
        ),
      ],
    );
  }

  
}
