// ignore_for_file: avoid_print

import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
  //* Logic NavBar Button .....
  //? Qouries....
  var tableIndex = 0;

void upDateIndex(int index)
{
tableIndex = index;
update();
} 


}