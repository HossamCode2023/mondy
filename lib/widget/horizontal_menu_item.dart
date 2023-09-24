import 'package:chil_out/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllers.dart';
import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
    final String itemName;
  final Function()? onTap;
  const HorizontalMenuItem({ Key? key,required this.itemName, this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
                  onTap: onTap,
                  onHover: (value){
                    value ?
                    menuController.onHover(itemName) : menuController.onHover("not hovering");
                  },
                  child: Obx(() => Container(
                    color: menuController.isHovering(itemName) ? AppTheme.lightGrey.withOpacity(.1) : Colors.transparent,
                    child: Row(
                      children: [
                        Visibility(
                          visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                            width: 6,
                            height: 40,
                            color: AppTheme.dark,
                          ),
                        ),
                       SizedBox(width:width / 88),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName),
                        ),
                        if(!menuController.isActive(itemName))
                        Flexible(child: CustomText(text: itemName , color: menuController.isHovering(itemName) ? AppTheme.dark : AppTheme.lightGrey,))
                        else
                        Flexible(child: CustomText(text: itemName , color:  AppTheme.dark , size: 18, weight: FontWeight.bold,))

                      ],
                    ),
                  ))
                );
  }
}