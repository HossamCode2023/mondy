// ignore_for_file: avoid_print

import 'package:chil_out/setting_services.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:io';
import 'route/app_page.dart';
import 'route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      
          );
  await initialServices();
  runApp(const MyApp());
}

//============= Services =================
Future initialServices() async {
  await Get.putAsync(
    () => SettingServices().openHiveBox('hossam'),
  );
  myBox = await SettingServices().openHiveBox('hossam');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('====================== User is currently signed out!');
      } else {
        print('======================= User is signed in!');
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
          enabled: true, //== devicePreview......
      builder: (BuildContext context) {
        return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute:FirebaseAuth.instance.currentUser == null ? AppRoute.splash :
      FirebaseAuth.instance.currentUser!.uid == 'IE4nPpNeaVd43phY8lloUL5icNj1'? AppRoute.siteLayout: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      // locale: const Locale('ar','SA'),
      // builder: EasyLoading.init(),
    );
      },
      
    );
    
  }
}
