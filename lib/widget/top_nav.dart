// ignore_for_file: non_constant_identifier_names

import 'package:chil_out/route/app_route.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:chil_out/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/responsive_screen.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
                children: [
                 Container(
                       
                      decoration: BoxDecoration(
                        color: AppTheme.light,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppTheme.dark.withOpacity(.7),width: 2)
                      ),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage('assets/icons/logo.png' ),
                        backgroundColor: AppTheme.light,
                    
                      ),
                    ),
                ],
              ),
          )
          : IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: AppTheme.lightGrey,
              )),
      elevation: 0,
      title: Row(
        children: [
          // Visibility(
          //   child: Obx(() => CustomText(
          //         text: menuController.activeItem.value.toString(),
          //         color: AppTheme.lightGrey,
          //         size: 20,
          //         weight: FontWeight.bold,
          //       )),
          // ),
          Expanded(child: Container()),
          const SizedBox(width: 20,),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: AppTheme.dark.withOpacity(0.7),
              )),
              IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.siteLayout);
              },
              icon: Icon(
                Icons.refresh_outlined,
                color: AppTheme.dark.withOpacity(0.7),
              )),
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: AppTheme.dark.withOpacity(0.7),
                  )),
              Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 12,
                    width: 12,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppTheme.active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppTheme.light, width: 2)),
                  ))
            ],
          ),

          Container(
            width: 1,
            height: 18,
            color: AppTheme.lightGrey,
          ),

          const SizedBox(
            width: 10,
          ),

          CustomText(
            text: 'Admin Panel',
            color: AppTheme.lightGrey,
          ),
          const SizedBox(
            width: 10,
          ),

        ],
      ),
      iconTheme: IconThemeData(color: AppTheme.dark),
      backgroundColor: Colors.transparent,
    );
