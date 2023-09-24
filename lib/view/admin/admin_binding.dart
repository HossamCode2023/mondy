import 'package:get/get.dart';

import '../../controller/menu_controller.dart';
import '../../controller/navigation_controller.dart';


class AdminBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.put(NavigationController());
    Get.put(MenuController());
    
  }
  
}