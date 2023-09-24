// ignore_for_file: use_key_in_widget_constructors

import 'package:chil_out/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoute.welcome);
    });

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset('assets/images/chill_out_logo.jpg')),
            // const Center(
            //   child: Text('محطة المشير 3',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
            // ),
          ],
        ),
      ),
    );
  }
}