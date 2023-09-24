// ignore_for_file: sort_child_properties_last, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:chil_out/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:jiffy/jiffy.dart';
 import '../../component/button.dart';
import '../../component/input_text_button.dart';
import '../../component/text_field_input.dart';
import '../../functions/function_share.dart';
import '../../functions/validation.dart';
import '../../widget/result_share.dart';

class EditShiftScreen extends StatefulWidget {
  final String docid;
  final String OldGunPetrolTotalPrice;
  final String OldVisaTotal;
  final String OldNameShif;
  
  const EditShiftScreen({super.key, required this.docid,
  required this.OldGunPetrolTotalPrice, required this.OldVisaTotal, 
  required this.OldNameShif, 
  });

  @override
  State<EditShiftScreen> createState() => _EditShiftScreenState();
}

class _EditShiftScreenState extends State<EditShiftScreen> {


@override
  void dispose() {
   homeController.salesTotalController;
   homeController.visaTotalController;
   homeController.nameShifController;
    super.dispose();
  }
  @override
  void initState() {
    homeController.salesTotalController.text = widget.OldGunPetrolTotalPrice;
    homeController.visaTotalController.text = widget.OldVisaTotal;
   homeController.nameShifController.text = widget.OldNameShif;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTextField(
                    color: Colors.black,
                    title: ' المبيعات',
                    textInputType: TextInputType.number,
                    textEditingController: homeController.salesTotalController,
                    validation: validateInputNumber,
                    width: widthScreen / 3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InputTextField(
                    width: widthScreen / 3,
                    color: Colors.black,
                    title: 'إجمالى الفيزا',
                    textInputType: TextInputType.number,
                    textEditingController: homeController.visaTotalController,
                    validation: validateInputNumber,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              
              InputTextField(
                    color: Colors.black,
                    title: ' رئيس الوردية',
                    textInputType: TextInputType.name,
                    textEditingController: homeController.nameShifController,
                    validation: validateInputName,
                    width: widthScreen / 2,
                  ),
                  const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (homeController.selectNumOffWorkers != null)
                      Text(
                        'عدد العمال =  ${homeController.selectNumOffWorkers} ',
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
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
                              hint: const Text(
                                'إختار عدد العمال',
                                style: TextStyle(color: Colors.white),
                              ),
                              items: [
                                1,
                                2,
                                3,
                                4,
                                5,
                                6,
                                7,
                                8,
                                9,
                                10,
                                11,
                                12,
                                13,
                                14,
                                15,
                                16
                              ]
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
              const SizedBox(
                height: 10,
              ),
              const ResultShare(),
              const SizedBox(
                height: 20,
              ),
              InputOutlineButton(
                title: 'إختبار',
                onClick: () {
                  setState(() {
                    homeController.calPetrolTotal();
homeController.calNameShif();
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
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextButton(
                title: 'تعديل',
                onClick: () {
                  homeController.setShift(context,widget.docid);
                  setState(() {
                 Get.toNamed("/dashboard");


                  });
                },
                color: const Color(0xffff8900),
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextButton(
                title: 'مشاركة',
                onClick: () {
                  shareScreenShot(
                      context: context, shareWidget: const ResultShare());
                },
                color:  Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
