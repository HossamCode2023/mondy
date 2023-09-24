// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unused_local_variable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/setting_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../functions/alert.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  //? Qouries....

  var dateTime = Jiffy.now().yMMMMEEEEdjm;
  TextEditingController gun1OldMechController = TextEditingController();
  TextEditingController gun2OldMechController = TextEditingController();
  TextEditingController gun3OldMechController = TextEditingController();
  TextEditingController gun4OldMechController = TextEditingController();
  TextEditingController gun5OldMechController = TextEditingController();
  TextEditingController gun6OldMechController = TextEditingController();
  TextEditingController gun7OldMechController = TextEditingController();
  TextEditingController gun8OldMechController = TextEditingController();
  TextEditingController gun9OldMechController = TextEditingController();
  TextEditingController gun10OldMechController = TextEditingController();
  TextEditingController gun11OldMechController = TextEditingController();
  TextEditingController gun12OldMechController = TextEditingController();
  TextEditingController gun13OldMechController = TextEditingController();
  TextEditingController gun14OldMechController = TextEditingController();
  TextEditingController gun15OldMechController = TextEditingController();
  TextEditingController gun16OldMechController = TextEditingController();
  TextEditingController gun1NewMechController = TextEditingController();
  TextEditingController gun2NewMechController = TextEditingController();
  TextEditingController gun3NewMechController = TextEditingController();
  TextEditingController gun4NewMechController = TextEditingController();
  TextEditingController gun5NewMechController = TextEditingController();
  TextEditingController gun6NewMechController = TextEditingController();
  TextEditingController gun7NewMechController = TextEditingController();
  TextEditingController gun8NewMechController = TextEditingController();
  TextEditingController gun9NewMechController = TextEditingController();
  TextEditingController gun10NewMechController = TextEditingController();
  TextEditingController gun11NewMechController = TextEditingController();
  TextEditingController gun12NewMechController = TextEditingController();
  TextEditingController gun13NewMechController = TextEditingController();
  TextEditingController gun14NewMechController = TextEditingController();
  TextEditingController gun15NewMechController = TextEditingController();
  TextEditingController gun16NewMechController = TextEditingController();

  TextEditingController gun1OldElecController = TextEditingController();
  TextEditingController gun2OldElecController = TextEditingController();
  TextEditingController gun3OldElecController = TextEditingController();
  TextEditingController gun4OldElecController = TextEditingController();
  TextEditingController gun5OldElecController = TextEditingController();
  TextEditingController gun6OldElecController = TextEditingController();
  TextEditingController gun7OldElecController = TextEditingController();
  TextEditingController gun8OldElecController = TextEditingController();
  TextEditingController gun9OldElecController = TextEditingController();
  TextEditingController gun10OldElecController = TextEditingController();
  TextEditingController gun11OldElecController = TextEditingController();
  TextEditingController gun12OldElecController = TextEditingController();
  TextEditingController gun13OldElecController = TextEditingController();
  TextEditingController gun14OldElecController = TextEditingController();
  TextEditingController gun15OldElecController = TextEditingController();
  TextEditingController gun16OldElecController = TextEditingController();
  TextEditingController gun1NewElecController = TextEditingController();
  TextEditingController gun2NewElecController = TextEditingController();
  TextEditingController gun3NewElecController = TextEditingController();
  TextEditingController gun4NewElecController = TextEditingController();
  TextEditingController gun5NewElecController = TextEditingController();
  TextEditingController gun6NewElecController = TextEditingController();
  TextEditingController gun7NewElecController = TextEditingController();
  TextEditingController gun8NewElecController = TextEditingController();
  TextEditingController gun9NewElecController = TextEditingController();
  TextEditingController gun10NewElecController = TextEditingController();
  TextEditingController gun11NewElecController = TextEditingController();
  TextEditingController gun12NewElecController = TextEditingController();
  TextEditingController gun13NewElecController = TextEditingController();
  TextEditingController gun14NewElecController = TextEditingController();
  TextEditingController gun15NewElecController = TextEditingController();
  TextEditingController gun16NewElecController = TextEditingController();

  //*===========================shift screen ===================
  TextEditingController salesTotalController = TextEditingController();
  TextEditingController workersNumController = TextEditingController();
  TextEditingController nameShifController = TextEditingController();

  RxBool checkBetweenOldAndNew = false.obs;

  void getValue(int? gun1Old) {
    gun1OldMechController.text = gun1Old.toString();
    print(gun1OldMechController);
  }

  int gun1LiterMech = 0;
  int gun2LiterMech = 0;
  int gun3LiterMech = 0;
  int gun4LiterMech = 0;
  int gun5LiterMech = 0;
  int gun6LiterMech = 0;
  int gun7LiterMech = 0;
  int gun8LiterMech = 0;
  int gun9LiterMech = 0;
  int gun10LiterMech = 0;
  int gun11LiterMech = 0;
  int gun12LiterMech = 0;
  int gun13LiterMech = 0;
  int gun14LiterMech = 0;
  int gun15LiterMech = 0;
  int gun16LiterMech = 0;

  int gun1LiterElec = 0;
  int gun2LiterElec = 0;
  int gun3LiterElec = 0;
  int gun4LiterElec = 0;
  int gun5LiterElec = 0;
  int gun6LiterElec = 0;
  int gun7LiterElec = 0;
  int gun8LiterElec = 0;
  int gun9LiterElec = 0;
  int gun10LiterElec = 0;
  int gun11LiterElec = 0;
  int gun12LiterElec = 0;
  int gun13LiterElec = 0;
  int gun14LiterElec = 0;
  int gun15LiterElec = 0;
  int gun16LiterElec = 0;

  RxInt petrol95Liter = 0.obs;
  RxInt petrol92Liter = 0.obs;
  RxDouble petrol95Value = 0.0.obs;
  RxDouble petrol92Value = 0.0.obs;

  double petrol95Price = 11.25;
  double petrol92Price = 10.50;

  RxInt gun1Mech = 0.obs;
  RxInt gun1Elec = 0.obs;
  RxInt gun1Dif = 0.obs;
  RxInt gun1 = 0.obs;
  RxInt gun2Mech = 0.obs;
  RxInt gun2Elec = 0.obs;
  RxInt gun2Dif = 0.obs;
  RxInt gun2 = 0.obs;
  RxInt gun3Mech = 0.obs;
  RxInt gun3Elec = 0.obs;
  RxInt gun3Dif = 0.obs;
  RxInt gun3 = 0.obs;
  RxInt gun4Mech = 0.obs;
  RxInt gun4Elec = 0.obs;
  RxInt gun4Dif = 0.obs;
  RxInt gun4 = 0.obs;
  RxInt gun5Mech = 0.obs;
  RxInt gun5Elec = 0.obs;
  RxInt gun5Dif = 0.obs;
  RxInt gun5 = 0.obs;
  RxInt gun6Mech = 0.obs;
  RxInt gun6Elec = 0.obs;
  RxInt gun6Dif = 0.obs;
  RxInt gun6 = 0.obs;
  RxInt gun7Mech = 0.obs;
  RxInt gun7Elec = 0.obs;
  RxInt gun7Dif = 0.obs;
  RxInt gun7 = 0.obs;
  RxInt gun8Mech = 0.obs;
  RxInt gun8Elec = 0.obs;
  RxInt gun8Dif = 0.obs;
  RxInt gun8 = 0.obs;
  RxInt gun9Mech = 0.obs;
  RxInt gun9Elec = 0.obs;
  RxInt gun9Dif = 0.obs;
  RxInt gun9 = 0.obs;
  RxInt gun10Mech = 0.obs;
  RxInt gun10Elec = 0.obs;
  RxInt gun10Dif = 0.obs;
  RxInt gun10 = 0.obs;
  RxInt gun11Mech = 0.obs;
  RxInt gun11Elec = 0.obs;
  RxInt gun11Dif = 0.obs;
  RxInt gun11 = 0.obs;
  RxInt gun12Mech = 0.obs;
  RxInt gun12Elec = 0.obs;
  RxInt gun12Dif = 0.obs;
  RxInt gun12 = 0.obs;
  RxInt gun13Mech = 0.obs;
  RxInt gun13Elec = 0.obs;
  RxInt gun13Dif = 0.obs;
  RxInt gun13 = 0.obs;
  RxInt gun14Mech = 0.obs;
  RxInt gun14Elec = 0.obs;
  RxInt gun14Dif = 0.obs;
  RxInt gun14 = 0.obs;
  RxInt gun15Mech = 0.obs;
  RxInt gun15Elec = 0.obs;
  RxInt gun15Dif = 0.obs;
  RxInt gun15 = 0.obs;
  RxInt gun16Mech = 0.obs;
  RxInt gun16Elec = 0.obs;
  RxInt gun16Dif = 0.obs;
  RxInt gun16 = 0.obs;

  RxInt gunPetrol95 = 0.obs;
  RxInt gunPetrol92 = 0.obs;
  RxInt gunPetrolTotalLiters = 0.obs;
  RxDouble gunPetrolTotalPrice = 0.0.obs;
  double priceOf95 = 11.50;
  double priceOf92 = 10.25;
  RxDouble percent30 = 0.0.obs;
  RxString nameShif = ''.obs;

  void calNameShif() {
    nameShif.value = nameShifController.text;
  }

  void calPetrolTotal() {
    double gasTotal = double.tryParse(salesTotalController.text) ?? 0.0;
    gunPetrolTotalPrice.value = gasTotal;
  }

  var selectGun;
  //*================================================
  var selectNumOffWorkers;
  RxString numWorkers = ''.obs;
  void calNumWorkers() {
    numWorkers.value = selectNumOffWorkers.toString();
  }

  RxInt workersOwed = 0.obs;
  void calWorkersOwed() {
    workersOwed.value = (selectNumOffWorkers - 3) * 300 + 525 + 360 + 360;
    update();
  }

  //*================================================
  RxDouble companyWorkers = 0.0.obs;
  void calCompWorkers() {
    companyWorkers.value = gunPetrolTotalPrice.value * 6.5 / 1000;
    update();
  }

//*=======================================================
  RxDouble visaTotal = 0.0.obs;
  TextEditingController visaTotalController = TextEditingController();
  void calVisa() {
    double visa = double.tryParse(visaTotalController.text) ?? 0.0;
    visaTotal.value = visa;

    update();
    print('visaTotal====================$visaTotal');
  }

//*=======================================================
  RxDouble percent_30 = 0.0.obs;
  void calPercent_30() {
    percent_30.value = gunPetrolTotalPrice.value * 0.0045;
    update();
  }

//*============================================
  RxDouble office = 0.0.obs;
  void calOffice() {
    office.value = companyWorkers.value - 150 - percent_30.value;
    update();
  }

//*==================================
  RxDouble companyTotal = 0.0.obs;
  void calComTotal() {
    companyTotal.value = companyWorkers.value * 2;
    update();
  }

//*======================================
  RxDouble shiftCheif = 0.0.obs;
  void calShiftCheif() {
    shiftCheif.value =
        gunPetrolTotalPrice.value + companyTotal.value - visaTotal.value;
    update();
  }

//*=======================================
  RxDouble bank = 0.0.obs;
  void calBank() {
    bank.value = gunPetrolTotalPrice.value - visaTotal.value;
    update();
  }

  //*======================================
  RxDouble support = 0.0.obs;
  void calSupport() {
    support.value = companyWorkers.value - workersOwed.value;
    update();
  }

  RxInt gasolineGaugesForAll = 0.obs;
  int gasolineGauges = 0;
  RxInt gasolineGaugesGun1 = 0.obs;
  RxInt gasolineGaugesGun2 = 0.obs;
  void gunDifference() {
    int gun1OldMech = int.tryParse(gun1OldMechController.text) ?? 0;
    int gun1NewMech = int.tryParse(gun1NewMechController.text) ?? 0;
    int gun2OldMech = int.tryParse(gun2OldMechController.text) ?? 0;
    int gun2NewMech = int.tryParse(gun2NewMechController.text) ?? 0;
    int gun3OldMech = int.tryParse(gun3OldMechController.text) ?? 0;
    int gun3NewMech = int.tryParse(gun3NewMechController.text) ?? 0;
    int gun4OldMech = int.tryParse(gun4OldMechController.text) ?? 0;
    int gun4NewMech = int.tryParse(gun4NewMechController.text) ?? 0;
    int gun5OldMech = int.tryParse(gun5OldMechController.text) ?? 0;
    int gun5NewMech = int.tryParse(gun5NewMechController.text) ?? 0;
    int gun6OldMech = int.tryParse(gun6OldMechController.text) ?? 0;
    int gun6NewMech = int.tryParse(gun6NewMechController.text) ?? 0;
    int gun7OldMech = int.tryParse(gun7OldMechController.text) ?? 0;
    int gun7NewMech = int.tryParse(gun7NewMechController.text) ?? 0;
    int gun8OldMech = int.tryParse(gun8OldMechController.text) ?? 0;
    int gun8NewMech = int.tryParse(gun8NewMechController.text) ?? 0;
    int gun9OldMech = int.tryParse(gun9OldMechController.text) ?? 0;
    int gun9NewMech = int.tryParse(gun9NewMechController.text) ?? 0;
    int gun10OldMech = int.tryParse(gun10OldMechController.text) ?? 0;
    int gun10NewMech = int.tryParse(gun10NewMechController.text) ?? 0;
    int gun11OldMech = int.tryParse(gun11OldMechController.text) ?? 0;
    int gun11NewMech = int.tryParse(gun11NewMechController.text) ?? 0;
    int gun12OldMech = int.tryParse(gun12OldMechController.text) ?? 0;
    int gun12NewMech = int.tryParse(gun12NewMechController.text) ?? 0;
    int gun13OldMech = int.tryParse(gun13OldMechController.text) ?? 0;
    int gun13NewMech = int.tryParse(gun13NewMechController.text) ?? 0;
    int gun14OldMech = int.tryParse(gun14OldMechController.text) ?? 0;
    int gun14NewMech = int.tryParse(gun14NewMechController.text) ?? 0;
    int gun15OldMech = int.tryParse(gun15OldMechController.text) ?? 0;
    int gun15NewMech = int.tryParse(gun15NewMechController.text) ?? 0;
    int gun16OldMech = int.tryParse(gun16OldMechController.text) ?? 0;
    int gun16NewMech = int.tryParse(gun16NewMechController.text) ?? 0;

    int gun1OldElec = int.tryParse(gun1OldElecController.text) ?? 0;
    int gun1NewElec = int.tryParse(gun1NewElecController.text) ?? 0;
    int gun2OldElec = int.tryParse(gun2OldElecController.text) ?? 0;
    int gun2NewElec = int.tryParse(gun2NewElecController.text) ?? 0;
    int gun3OldElec = int.tryParse(gun3OldElecController.text) ?? 0;
    int gun3NewElec = int.tryParse(gun3NewElecController.text) ?? 0;
    int gun4OldElec = int.tryParse(gun4OldElecController.text) ?? 0;
    int gun4NewElec = int.tryParse(gun4NewElecController.text) ?? 0;
    int gun5OldElec = int.tryParse(gun5OldElecController.text) ?? 0;
    int gun5NewElec = int.tryParse(gun5NewElecController.text) ?? 0;
    int gun6OldElec = int.tryParse(gun6OldElecController.text) ?? 0;
    int gun6NewElec = int.tryParse(gun6NewElecController.text) ?? 0;
    int gun7OldElec = int.tryParse(gun7OldElecController.text) ?? 0;
    int gun7NewElec = int.tryParse(gun7NewElecController.text) ?? 0;
    int gun8OldElec = int.tryParse(gun8OldElecController.text) ?? 0;
    int gun8NewElec = int.tryParse(gun8NewElecController.text) ?? 0;
    int gun9OldElec = int.tryParse(gun9OldElecController.text) ?? 0;
    int gun9NewElec = int.tryParse(gun9NewElecController.text) ?? 0;
    int gun10OldElec = int.tryParse(gun10OldElecController.text) ?? 0;
    int gun10NewElec = int.tryParse(gun10NewElecController.text) ?? 0;
    int gun11OldElec = int.tryParse(gun11OldElecController.text) ?? 0;
    int gun11NewElec = int.tryParse(gun11NewElecController.text) ?? 0;
    int gun12OldElec = int.tryParse(gun12OldElecController.text) ?? 0;
    int gun12NewElec = int.tryParse(gun12NewElecController.text) ?? 0;
    int gun13OldElec = int.tryParse(gun13OldElecController.text) ?? 0;
    int gun13NewElec = int.tryParse(gun13NewElecController.text) ?? 0;
    int gun14OldElec = int.tryParse(gun14OldElecController.text) ?? 0;
    int gun14NewElec = int.tryParse(gun14NewElecController.text) ?? 0;
    int gun15OldElec = int.tryParse(gun15OldElecController.text) ?? 0;
    int gun15NewElec = int.tryParse(gun15NewElecController.text) ?? 0;
    int gun16OldElec = int.tryParse(gun16OldElecController.text) ?? 0;
    int gun16NewElec = int.tryParse(gun16NewElecController.text) ?? 0;

    gun1Mech.value = gun1NewMech - gun1OldMech;
    gun1Elec.value = gun1NewElec - gun1OldElec;

    gun2Mech.value = gun2NewMech - gun2OldMech;
    gun2Elec.value = gun2NewElec - gun2OldElec;

    gun3Mech.value = gun3NewMech - gun3OldMech;
    gun3Elec.value = gun3NewElec - gun3OldElec;

    gun4Mech.value = gun4NewMech - gun4OldMech;
    gun4Elec.value = gun4NewElec - gun4OldElec;

    gun5Mech.value = gun5NewMech - gun5OldMech;
    gun5Elec.value = gun5NewElec - gun5OldElec;

    gun6Mech.value = gun6NewMech - gun6OldMech;
    gun6Elec.value = gun6NewElec - gun6OldElec;

    gun7Mech.value = gun7NewMech - gun7OldMech;
    gun7Elec.value = gun7NewElec - gun7OldElec;

    gun8Mech.value = gun8NewMech - gun8OldMech;
    gun8Elec.value = gun8NewElec - gun8OldElec;

    gun9Mech.value = gun9NewMech - gun9OldMech;
    gun9Elec.value = gun9NewElec - gun9OldElec;

    gun10Mech.value = gun10NewMech - gun10OldMech;
    gun10Elec.value = gun10NewElec - gun10OldElec;

    gun11Mech.value = gun11NewMech - gun11OldMech;
    gun11Elec.value = gun11NewElec - gun11OldElec;

    gun12Mech.value = gun12NewMech - gun12OldMech;
    gun12Elec.value = gun12NewElec - gun12OldElec;

    gun13Mech.value = gun13NewMech - gun13OldMech;
    gun13Elec.value = gun13NewElec - gun13OldElec;

    gun14Mech.value = gun14NewMech - gun14OldMech;
    gun14Elec.value = gun14NewElec - gun14OldElec;

    gun15Mech.value = gun15NewMech - gun15OldMech;
    gun15Elec.value = gun15NewElec - gun15OldElec;

    gun16Mech.value = gun16NewMech - gun16OldMech;
    gun16Elec.value = gun16NewElec - gun16OldElec;

    gun1Dif.value = gun1Elec.value - gun1Mech.value;
    gun2Dif.value = gun2Elec.value - gun2Mech.value;
    gun3Dif.value = gun3Elec.value - gun3Mech.value;
    gun4Dif.value = gun4Elec.value - gun4Mech.value;
    gun5Dif.value = gun5Elec.value - gun5Mech.value;
    gun6Dif.value = gun6Elec.value - gun6Mech.value;
    gun7Dif.value = gun7Elec.value - gun7Mech.value;
    gun8Dif.value = gun8Elec.value - gun8Mech.value;
    gun9Dif.value = gun9Elec.value - gun9Mech.value;
    gun10Dif.value = gun10Elec.value - gun10Mech.value;
    gun11Dif.value = gun11Elec.value - gun11Mech.value;
    gun12Dif.value = gun12Elec.value - gun12Mech.value;
    gun13Dif.value = gun13Elec.value - gun13Mech.value;
    gun14Dif.value = gun14Elec.value - gun14Mech.value;
    gun15Dif.value = gun15Elec.value - gun15Mech.value;
    gun16Dif.value = gun16Elec.value - gun16Mech.value;

    if (selectGun == 'الجميع') {
      gun1Mech = gun1Mech - 20;
      gun1Elec = gun1Elec - 20;
      gun2Mech = gun2Mech - 20;
      gun2Elec = gun2Elec - 20;
      gun3Mech = gun3Mech - 20;
      gun3Elec = gun3Elec - 20;
      gun4Mech = gun4Mech - 20;
      gun4Elec = gun4Elec - 20;
      gun5Mech = gun5Mech - 20;
      gun5Elec = gun5Elec - 20;
      gun6Mech = gun6Mech - 20;
      gun6Elec = gun6Elec - 20;
      gun7Mech = gun7Mech - 20;
      gun7Elec = gun7Elec - 20;
      gun8Mech = gun8Mech - 20;
      gun8Elec = gun8Elec - 20;
      gun9Mech = gun9Mech - 20;
      gun9Elec = gun9Elec - 20;
      gun10Mech = gun10Mech - 20;
      gun10Elec = gun10Elec - 20;
      gun11Mech = gun11Mech - 20;
      gun11Elec = gun11Elec - 20;
      gun12Mech = gun12Mech - 20;
      gun12Elec = gun12Elec - 20;
      gun13Mech = gun13Mech - 20;
      gun13Elec = gun13Elec - 20;
      gun14Mech = gun14Mech - 20;
      gun14Elec = gun14Elec - 20;
      gun15Mech = gun15Mech - 20;
      gun15Elec = gun15Elec - 20;
      gun16Mech = gun16Mech - 20;
      gun16Elec = gun16Elec - 20;
      gasolineGauges = 20;
      update();
      print('الجميع============================$gasolineGauges ');
    } else if (selectGun == 'لا يوجد') {
      gasolineGauges = 0;
      gasolineGaugesForAll = 0.obs;

      update();
    }
    if (gun1Mech.value > gun1Elec.value) {
      gun1.value = gun1Mech.value;
      update();
    } else {
      gun1.value = gun1Elec.value;
      update();
    }
    if (gun2Mech.value > gun2Elec.value) {
      gun2.value = gun2Mech.value;
    } else {
      gun2.value = gun2Elec.value;
    }
    if (gun3Mech.value > gun3Elec.value) {
      gun3.value = gun3Mech.value;
    } else {
      gun3.value = gun3Elec.value;
    }
    if (gun4Mech.value > gun4Elec.value) {
      gun4.value = gun4Mech.value;
    } else {
      gun4.value = gun4Elec.value;
    }
    if (gun5Mech.value > gun5Elec.value) {
      gun5.value = gun5Mech.value;
    } else {
      gun5.value = gun5Elec.value;
    }
    if (gun6Mech.value > gun6Elec.value) {
      gun6.value = gun6Mech.value;
    } else {
      gun6.value = gun6Elec.value;
    }
    if (gun7Mech.value > gun7Elec.value) {
      gun7.value = gun7Mech.value;
    } else {
      gun7.value = gun7Elec.value;
    }
    if (gun8Mech.value > gun8Elec.value) {
      gun8.value = gun8Mech.value;
    } else {
      gun8.value = gun8Elec.value;
    }
    if (gun9Mech.value > gun9Elec.value) {
      gun9.value = gun9Mech.value;
    } else {
      gun9.value = gun9Elec.value;
    }
    if (gun10Mech.value > gun10Elec.value) {
      gun10.value = gun10Mech.value;
    } else {
      gun10.value = gun10Elec.value;
    }
    if (gun11Mech.value > gun11Elec.value) {
      gun11.value = gun11Mech.value;
    } else {
      gun11.value = gun11Elec.value;
    }
    if (gun12Mech.value > gun12Elec.value) {
      gun12.value = gun12Mech.value;
    } else {
      gun12.value = gun12Elec.value;
    }
    if (gun13Mech.value > gun13Elec.value) {
      gun13.value = gun13Mech.value;
    } else {
      gun13.value = gun13Elec.value;
    }
    if (gun14Mech.value > gun14Elec.value) {
      gun14.value = gun14Mech.value;
    } else {
      gun14.value = gun14Elec.value;
    }
    if (gun15Mech.value > gun15Elec.value) {
      gun15.value = gun15Mech.value;
    } else {
      gun15.value = gun15Elec.value;
    }
    if (gun16Mech.value > gun16Elec.value) {
      gun16.value = gun16Mech.value;
    } else {
      gun16.value = gun16Elec.value;
    }
    print('$gasolineGauges============================مسدس1 ');
    update();
    print('gun1Mech============================$gun1Mech ');
    print('gun1Elec============================$gun1Elec ');
    print('gun1Dif============================$gun1Dif ');
    print('gun1============================$gun1 ');
    // print('selectGun============================$selectGun ');
  }

  void calculateSum() {
    gunPetrol95.value = gun1.value +
        gun3.value +
        gun5.value +
        gun7.value +
        gun9.value +
        gun11.value +
        gun13.value +
        gun15.value;
    gunPetrol92.value = gun2.value +
        gun4.value +
        gun6.value +
        gun8.value +
        gun10.value +
        gun12.value +
        gun14.value +
        gun16.value;
    gunPetrolTotalLiters.value = gunPetrol95.value + gunPetrol92.value;
    petrol95Value.value = gunPetrol95.value * priceOf95;
    petrol92Value.value = gunPetrol92.value * priceOf92;
    gunPetrolTotalPrice.value = petrol95Value.value + petrol92Value.value;
    percent30.value = gunPetrolTotalPrice.value * 0.0045;
    update();
    print('gunPetrol95============================$gunPetrol95 ');
    print('gunPetrol92============================$gunPetrol92 ');
    print('petrol95Value============================$petrol95Value ');
    print('petrol92Value============================$petrol92Value ');
    print(
        'gunPetrolTotalLiters============================$gunPetrolTotalLiters ');
    print(
        'gunPetrolTotalPrice============================$gunPetrolTotalPrice ');
  }

  void storeOldValue() {
    myBox!.put('gun1OldMechController', gun1NewMechController.text);
    myBox!.put('gun1OldElecController', gun1NewElecController.text);
    myBox!.put('gun2OldMechController', gun2NewMechController.text);
    myBox!.put('gun2OldElecController', gun2NewElecController.text);
    myBox!.put('gun3OldMechController', gun3NewMechController.text);
    myBox!.put('gun3OldElecController', gun3NewElecController.text);
    myBox!.put('gun4OldMechController', gun4NewMechController.text);
    myBox!.put('gun4OldElecController', gun4NewElecController.text);
    myBox!.put('gun5OldMechController', gun5NewMechController.text);
    myBox!.put('gun5OldElecController', gun5NewElecController.text);
    myBox!.put('gun6OldMechController', gun6NewMechController.text);
    myBox!.put('gun6OldElecController', gun6NewElecController.text);
    myBox!.put('gun7OldMechController', gun7NewMechController.text);
    myBox!.put('gun7OldElecController', gun7NewElecController.text);
    myBox!.put('gun8OldMechController', gun8NewMechController.text);
    myBox!.put('gun8OldElecController', gun8NewElecController.text);
    myBox!.put('gun9OldMechController', gun9NewMechController.text);
    myBox!.put('gun9OldElecController', gun9NewElecController.text);
    myBox!.put('gun10OldMechController', gun10NewMechController.text);
    myBox!.put('gun10OldElecController', gun10NewElecController.text);
    myBox!.put('gun11OldMechController', gun11NewMechController.text);
    myBox!.put('gun11OldElecController', gun11NewElecController.text);
    myBox!.put('gun12OldMechController', gun12NewMechController.text);
    myBox!.put('gun12OldElecController', gun12NewElecController.text);
    myBox!.put('gun13OldMechController', gun13NewMechController.text);
    myBox!.put('gun13OldElecController', gun13NewElecController.text);
    myBox!.put('gun14OldMechController', gun14NewMechController.text);
    myBox!.put('gun14OldElecController', gun14NewElecController.text);
    myBox!.put('gun15OldMechController', gun15NewMechController.text);
    myBox!.put('gun15OldElecController', gun15NewElecController.text);
    myBox!.put('gun16OldMechController', gun16NewMechController.text);
    myBox!.put('gun16OldElecController', gun16NewElecController.text);

    print(' open mybox ===========');
  }

  @override
  void onInit() {
    gun1OldMechController.text = myBox!.get('gun1OldMechController') ?? '';
    gun1OldElecController.text = myBox!.get('gun1OldElecController') ?? '';
    gun2OldMechController.text = myBox!.get('gun2OldMechController') ?? '';
    gun2OldElecController.text = myBox!.get('gun2OldElecController') ?? '';
    gun3OldMechController.text = myBox!.get('gun3OldMechController') ?? '';
    gun3OldElecController.text = myBox!.get('gun3OldElecController') ?? '';
    gun4OldMechController.text = myBox!.get('gun4OldMechController') ?? '';
    gun4OldElecController.text = myBox!.get('gun4OldElecController') ?? '';
    gun5OldMechController.text = myBox!.get('gun5OldMechController') ?? '';
    gun5OldElecController.text = myBox!.get('gun5OldElecController') ?? '';
    gun6OldMechController.text = myBox!.get('gun6OldMechController') ?? '';
    gun6OldElecController.text = myBox!.get('gun6OldElecController') ?? '';
    gun7OldMechController.text = myBox!.get('gun7OldMechController') ?? '';
    gun7OldElecController.text = myBox!.get('gun7OldElecController') ?? '';
    gun8OldMechController.text = myBox!.get('gun8OldMechController') ?? '';
    gun8OldElecController.text = myBox!.get('gun8OldElecController') ?? '';
    gun9OldMechController.text = myBox!.get('gun9OldMechController') ?? '';
    gun9OldElecController.text = myBox!.get('gun9OldElecController') ?? '';
    gun10OldMechController.text = myBox!.get('gun10OldMechController') ?? '';
    gun10OldElecController.text = myBox!.get('gun10OldElecController') ?? '';
    gun11OldMechController.text = myBox!.get('gun11OldMechController') ?? '';
    gun11OldElecController.text = myBox!.get('gun11OldElecController') ?? '';
    gun12OldMechController.text = myBox!.get('gun12OldMechController') ?? '';
    gun12OldElecController.text = myBox!.get('gun12OldElecController') ?? '';
    gun13OldMechController.text = myBox!.get('gun13OldMechController') ?? '';
    gun13OldElecController.text = myBox!.get('gun13OldElecController') ?? '';
    gun14OldMechController.text = myBox!.get('gun14OldMechController') ?? '';
    gun14OldElecController.text = myBox!.get('gun14OldElecController') ?? '';
    gun15OldMechController.text = myBox!.get('gun15OldMechController') ?? '';
    gun15OldElecController.text = myBox!.get('gun15OldElecController') ?? '';
    gun16OldMechController.text = myBox!.get('gun16OldMechController') ?? '';
    gun16OldElecController.text = myBox!.get('gun16OldElecController') ?? '';
    getStationAndmanagerName();

    super.onInit();
  }

  String time = Jiffy.now().format(pattern: 'd/M/yyyy   h:mm a').toString();
  CollectionReference shift = FirebaseFirestore.instance.collection('shift');
  
  
//*==== Function to add data to Firebass ==========================================

  Future<void> addShift(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return shift.add({
      
       'stationName': stationName,
      'manager':  manager,
      'dateTime': time,
      'nameShif': nameShif.value,
      'numWorkers': numWorkers.value.toString(),
      'gunPetrol95': gunPetrol95.value,
      'petrol95Value': petrol95Value.value.toStringAsFixed(2),
      'petrol92Value': petrol92Value.value.toStringAsFixed(2),
      'gunPetrol92': gunPetrol92.value,
      'gunPetrolTotalLiters': gunPetrolTotalLiters.value.toStringAsFixed(2),
      'gunPetrolTotalPrice': gunPetrolTotalPrice.value.toStringAsFixed(2),
      'workersOwed': workersOwed.value.toStringAsFixed(2),
      'visaTotal': visaTotal.toStringAsFixed(2),
      'companyWorkers': companyWorkers.toStringAsFixed(2),
      'percent_30': percent_30.toStringAsFixed(2),
      'office': office.toStringAsFixed(2),
      'companyTotal': companyTotal.toStringAsFixed(2),
      'shiftCheif': shiftCheif.toStringAsFixed(2),
      'bank': bank.toStringAsFixed(2),
      'support': support.toStringAsFixed(2),
      'selectNumOffWorkers': selectNumOffWorkers.toStringAsFixed(2),
      'id': FirebaseAuth.instance.currentUser!
          .uid, //* ========= to save for user ===============
    }).then((value) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Success!',
          message: 'Your data saved ',
          contentType: ContentType.success);
          storeOldValue();
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

//*==== Function to delete data to Firebass ==========================================

  Future<void> deleteShift(BuildContext context, String docid) {
    return FirebaseFirestore.instance
        .collection('shift')
        .doc(docid)
        .delete()
        .then((value) {
//! Alert =========================
      alert(
          context: context,
          title: 'Success',
          message: 'Your data is delete',
          contentType: ContentType.success);
    }).catchError((error) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Error!',
          message: '$error',
          contentType: ContentType.failure);
    });
  }


  
   bool isLoading = true;

 
String stationName = '';
String manager = '';
  getStationAndmanagerName() async{
      List<QueryDocumentSnapshot> data = [];

          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    isLoading = false;
    stationName = data[0]['stationName'];
    manager = data[0]['managerNow'];
    update();
        
  }

//*==== Function to set data to Firebass =====================================
  Future<void> setShift(BuildContext context, String docid) {
    // Call the user's CollectionReference to add a new user
    return shift.doc(docid).set({
    'stationName':stationName,
      'manager':  manager,
      'dateTime': time,
      'nameShif': nameShif.value,
      'numWorkers': numWorkers.value.toString(),
      'gunPetrol95': gunPetrol95.value,
      'petrol95Value': petrol95Value.value.toStringAsFixed(2),
      'petrol92Value': petrol92Value.value.toStringAsFixed(2),
      'gunPetrol92': gunPetrol92.value,
      'gunPetrolTotalLiters': gunPetrolTotalLiters.value,
      'gunPetrolTotalPrice': gunPetrolTotalPrice.value.toStringAsFixed(2),
      'workersOwed': workersOwed.value.toStringAsFixed(2),
      'visaTotal': visaTotal.toStringAsFixed(2),
      'companyWorkers': companyWorkers.toStringAsFixed(2),
      'percent_30': percent_30.toStringAsFixed(2),
      'office': office.toStringAsFixed(2),
      'companyTotal': companyTotal.toStringAsFixed(2),
      'shiftCheif': shiftCheif.toStringAsFixed(2),
      'bank': bank.toStringAsFixed(2),
      'support': support.value,
      'selectNumOffWorkers': selectNumOffWorkers.toStringAsFixed(2),
      'id': FirebaseAuth.instance.currentUser!
          .uid,
    },SetOptions(merge: true)
    ) //* ========= to save for user ===============
        .then((value) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Success!',
          message: 'Your data saved ',
          contentType: ContentType.success);
    }).catchError((error) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Error!',
          message: '$error',
          contentType: ContentType.failure);
    });
  }


  // //*==== Function to set data to Firebass =====================================
  // Future<void> setShift(BuildContext context) {
  //   // Call the user's CollectionReference to add a new user
  //   return shift.doc().set({
  //     'stationName':stationName,
  //     'manager':  manager,
  //     'gunPetrolTotalPrice': gunPetrolTotalPrice.value.toStringAsFixed(2),
  //     'visaTotal': visaTotal.toStringAsFixed(2),
  //     'selectNumOffWorkers': selectNumOffWorkers.toStringAsFixed(2),
  //     'gunPetrol95': gunPetrol95.value.toStringAsFixed(2),
  //     'petrol95Value': petrol95Value.value.toStringAsFixed(2),
  //     'petrol92Value': petrol92Value.value.toStringAsFixed(2),
  //     'gunPetrol92': gunPetrol92.value.toStringAsFixed(2),
  //     'gunPetrolTotalLiters': gunPetrolTotalLiters.value.toStringAsFixed(2),
  //     'workersOwed': workersOwed.value.toStringAsFixed(2),
  //     'companyWorkers': companyWorkers.toStringAsFixed(2),
  //     'percent_30': percent_30.toStringAsFixed(2),
  //     'office': office.toStringAsFixed(2),
  //     'companyTotal': companyTotal.toStringAsFixed(2),
  //     'shiftCheif': shiftCheif.toStringAsFixed(2),
  //     'bank': bank.toStringAsFixed(2),
  //     'support': support.toStringAsFixed(2),
  //     'nameShif': nameShif.value,
  //     'numWorkers': numWorkers.value.toString(),
  //   }) //* ========= to save for user ===============
  //       .then((value) {
  //     //! Alert =========================
  //     alert(
  //         context: context,
  //         title: 'Success!',
  //         message: 'Your data saved ',
  //         contentType: ContentType.success);
  //   }).catchError((error) {
  //     //! Alert =========================
  //     alert(
  //         context: context,
  //         title: 'Error!',
  //         message: '$error',
  //         contentType: ContentType.failure);
  //   });
  // }

  
}
