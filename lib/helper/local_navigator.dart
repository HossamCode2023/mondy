import 'package:chil_out/route/app_route.dart';
import 'package:flutter/cupertino.dart';


import '../controller/controllers.dart';
import '../route/router.dart';
//*=========== Methode return nevigator route ======================
Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,  // for which i choice =========
      
      initialRoute: AppRoute.overviewPageRoute,  // for initialization =========
    );
