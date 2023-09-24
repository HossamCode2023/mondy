import 'package:get/get.dart';

import '../../controller/share_controller.dart';


class ShareBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.put(ShareController());
    
  }
  
}