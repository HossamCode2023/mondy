import 'package:chil_out/view/shifts/widgets/shifts_table.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/controllers.dart';
import '../../helper/responsive_screen.dart';
import '../../widget/custom_text.dart';

class ShiftsPage extends StatelessWidget {
  const ShiftsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
         final widthScreen = MediaQuery.of(context).size.width;

    return Column(
        children: [
          Obx(
            () => Row(
              children: [
                //*============== Title page =====================================================
               Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 75 : 6,
                    left: ResponsiveWidget.isSmallScreen(context) ? 60 : 60),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: widthScreen / 14,
                  weight: FontWeight.bold,
                ),
              ),
                //*============== Title page =====================================================
    
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: const [ShiftsTable()],
          )),
        ],
      );
  }
}
