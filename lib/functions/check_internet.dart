// ignore_for_file: avoid_print, unused_import

import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


 BuildContext? context;

checkInternet()async
{
try {
  
var result = await InternetAddress.lookup('google.com');
if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  print('=============== Check Internet ==========================');
  print(result);
  print('=============== Check Internet ==========================');

  return true;
  
}


}on SocketException catch (e) {
  
  Get.snackbar('Error', 'No internet connection',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
  print('=============== Check Internet ==========================');
  print(e);
  print('=============== Check Internet ==========================');
  return false;
}

}