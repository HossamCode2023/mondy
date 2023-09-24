import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//*=== Function to navigation to route which i choice it ================
  Future<dynamic> navigateTo(String routeName){
    return navigatorKey.currentState!.pushNamed(routeName);
  }

//*=== Function to navigation to back ================
  goBack() => navigatorKey.currentState?.pop();

}