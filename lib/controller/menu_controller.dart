import 'package:chil_out/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/display_name.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  //? queries active and hover items =======================
RxString activeItem = overviewPageDisplayName.obs;    // ======== Over View for init ============

  var hoverItem = "".obs;


//*===== Functions to change active item to item name =================
  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

//*===== Functions to change hover item to item name =================

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

//* Build widget for items(name , icon) ==================
  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case shiftsPageDisplayName:
        return _customIcon(Icons.account_balance, itemName);
      case assetsPageDisplayName:
        return _customIcon(Icons.assessment_outlined, itemName);
      case clientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

//* Build widget for items(icon) ==================
  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: AppTheme.dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? AppTheme.dark : AppTheme.lightGrey,
    );
  }
}
