// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constants/display_name.dart';
import '../controller/controllers.dart';
import '../functions/alert.dart';
import '../helper/responsive_screen.dart';
import '../route/app_route.dart';
import 'custom_text.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: AppTheme.light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Container(
                      decoration: BoxDecoration(
                          color: AppTheme.light,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: AppTheme.dark.withOpacity(.7), width: 2)),
                      child: CircleAvatar(
                        backgroundImage:
                            const AssetImage('assets/icons/logo.png'),
                        backgroundColor: AppTheme.light,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: AppTheme.active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: AppTheme.lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () async {
                      if (item.route == AppRoute.authenticationPageRoute) {
                        await FirebaseAuth.instance.signOut();
                        //! Alert =========================
                        alert(
                            context: context,
                            title: 'Cood bay!',
                            message: 'See you later!',
                            contentType: ContentType.success);
                        Get.offAllNamed(AppRoute.splash);

                        menuController
                            .changeActiveItemTo(overviewPageDisplayName);
                      }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(item.route);
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
