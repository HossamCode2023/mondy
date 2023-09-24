// ignore_for_file: deprecated_member_use

import 'package:chil_out/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../route/app_route.dart';
import '../../widget/elevatedButtonUtils.dart';
import '../../widget/text_utils.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('assets/images/welcome.jpg',
                  fit: BoxFit.cover),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppTheme.lightTextColor.withOpacity(0.2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      height: 60.0,
                      width: 190.0,
                      decoration: BoxDecoration(
                          color: AppTheme.lightTextColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                          child: TextUtils(
                        text: 'Welcome',
                        fontSize: 35.0,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.light,
                        decoration: TextDecoration.none,
                      )),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        height: 60.0,
                        width: 270.0,
                        decoration: BoxDecoration(
                            color: AppTheme.lightTextColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextUtils(
                              text: 'Chill Out',
                              fontSize: 35.0,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.lightPrimaryColor,
                              decoration: TextDecoration.none,
                            ),
                            TextUtils(
                              text: 'Stations',
                              fontSize: 35.0,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.light,
                              decoration: TextDecoration.none,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 250.0,
                    ),
                    ElevatedButtonUtils(
                      onPressed: () {
                        Get.offNamed(AppRoute.signIn);
                      },
                      color: AppTheme.light,
                      decoration: TextDecoration.none,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                      text: 'Get Start',
                      paddingHerizontal: 40.0,
                      paddingVertical: 12.0,
                      primary: AppTheme.lightPrimaryColor,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'You are Admin?',
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.light,
                          decoration: TextDecoration.none,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(AppRoute.authenticationPageRoute);
                          },
                          child: TextUtils(
                            text: 'Log In',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.light,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
