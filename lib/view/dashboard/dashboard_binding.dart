import 'package:chil_out/controller/auth_controller.dart';
import 'package:chil_out/controller/dashboard_controller.dart';
import 'package:chil_out/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../controller/share_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(AuthController());
     Get.put(ShareController());
    
  }
  
}