
// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously


import 'package:chil_out/view/share/all_blankes_screen.dart';
import 'package:chil_out/view/share/section6_screen.dart';
import 'package:chil_out/view/share/shift_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'car_product_come_screen.dart';
import 'car_product_go_screen .dart';

 // import 'package:get/get.dart';


class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
            
          const SizedBox(height: 50),
          buildAccountCard(title: 'تمام الفراغات', onClick: () {Get.to(()=>const AllBlankesScreen());}),
          buildAccountCard(title: 'تمام القطاع الصباحى', onClick: () {Get.to(() => const Section6Screen());}),
          buildAccountCard(title: 'وصل عربية المنتج', onClick: () {Get.to(()=> const CarProductCome());}),
          buildAccountCard(title: 'مغادرة عربية المنتج', onClick: () {Get.to(()=> const CarProductGo());}),
           buildAccountCard(title: ' تقفيل الوردية', onClick: () {Get.to(() => const ShiftScreen());}),
          
        ],
      ),
    );
  }

  Widget buildAccountCard({required String title, required Function onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 7,
                  spreadRadius: 0.1,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
