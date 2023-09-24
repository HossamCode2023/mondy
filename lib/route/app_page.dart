import 'package:chil_out/view/admin/layout.dart';
import 'package:chil_out/route/app_route.dart';
import 'package:chil_out/view/account/account_screen.dart';
import 'package:chil_out/view/auth/auth_binding.dart';
import 'package:chil_out/view/auth/sign_in_screen.dart';
import 'package:chil_out/view/auth/sign_up_screen.dart';
import 'package:chil_out/view/choice_manager/choice_manager.dart';
import 'package:chil_out/view/dashboard/dashboard_binding.dart';
import 'package:chil_out/view/dashboard/dashboard_screen.dart';
import 'package:chil_out/view/home/home_binding.dart';
import 'package:chil_out/view/home/home_screen.dart';
import 'package:chil_out/view/history/history_screen.dart';
import 'package:chil_out/view/share/all_blankes_screen.dart';
import 'package:chil_out/view/share/section6_screen.dart';
import 'package:chil_out/view/share/share_binding.dart';
import 'package:chil_out/view/show/show_test.dart';
import 'package:chil_out/view/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../view/admin/admin_binding.dart';
import '../view/auth_admin/authentication.dart';
import '../view/home/main_home_screen.dart';
import '../view/overview/overview.dart';
import '../view/setting/users/setting_users.dart';
import '../view/share/share_screen.dart';
import '../view/welcome/welcome_view.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () =>  const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.home, 
      page: () =>  const HomeScreen(),
      binding: HomeBinding(),
      ),
      GetPage(
      name: AppRoute.account, 
      page: () => const AccountScreen(),
      ),
      GetPage(
      name: AppRoute.history, 
      page: () => const HistoryScreen(),
      binding: ShareBinding(),
      ),
      GetPage(
      name: AppRoute.splash, 
      page: () =>  SplashScreen(),
      ),
      GetPage(
      name: AppRoute.showTest, 
      page: () =>  const ShowTest(),
       binding: HomeBinding(),
      ),
       GetPage(
      name: AppRoute.signIn, 
      page: () =>  const SignInScreen(),
       binding: AuthBinding(),
      ),
       GetPage(
      name: AppRoute.signUp, 
      page: () =>  const SignUpScreen(),
       binding: AuthBinding(),
      ),
       GetPage(
      name: AppRoute.share, 
      page: () =>  const ShareScreen(),
      //  binding: AuthBinding(),
      ),
      GetPage(
      name: AppRoute.mainHome, 
      page: () =>  const MainHomeScreen(),
       binding: HomeBinding(),
      ),
      GetPage(
      name: AppRoute.allBlankes, 
      page: () =>   const AllBlankesScreen(),
       binding: ShareBinding(),
      ),
      GetPage(
      name: AppRoute.section6, 
      page: () =>   const Section6Screen(),
       binding: ShareBinding(),
      ),
      GetPage(
      name: AppRoute.siteLayout, 
      page: () =>    SiteLayout(),
       binding: AdminBinding(),
      ),
      GetPage(
      name: AppRoute.authenticationPageRoute, 
      page: () =>    const AuthenticationPage(),
      //  binding: AdminBinding(),
      ),
      GetPage(
      name: AppRoute.overviewPageRoute, 
      page: () =>    const OverviewPage(),
      ),
       GetPage(
      name: AppRoute.welcome, 
      page: () =>    const WelcomeView(),
      ),
       GetPage(
      name: AppRoute.settingUsers, 
      page: () =>    const SettingUsers(),
      ),
      GetPage(
      name: AppRoute.choiceManager, 
      page: () =>    const ChoiceManager(),
      ),
    
  ];
}