import 'package:chil_out/functions/check_internet.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';



  Box? myBox;

class SettingServices extends GetxService {
Future<Box> openHiveBox(String boxName) async {
checkInternet();
if (!Hive.isBoxOpen(boxName)) {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  }
return await Hive.openBox(boxName);
}


  
}
