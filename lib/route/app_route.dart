


import '../constants/display_name.dart';

class AppRoute {
  static const String rootRoute = "/";

  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String history = '/history';
  static const String splash = '/splash';
  static const String account = '/account';
  static const String showTest = '/showTest';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String share = '/share';
  static const String mainHome = '/mainHome';
  static const String allBlankes = '/allBlankes';
  static const String section6 = '/section6';
  static const String siteLayout = '/siteLayout';
  static const String overviewPageRoute = "/overview";
  static const String shiftsPageRoute = "/drivers";
  static const String clientsPageRoute = "/clients";
  static const String authenticationPageRoute = "/auth";
  static const String assetsPageRoute = "/assets";
  static const String welcome = "/welcome";
  static const String settingUsers = "/settingUsers";
  static const String choiceManager = "/choiceManager";
}

//* Greate class for menu item ========================
class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

//* Greate List for menu item type MenuItem ========================

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, AppRoute.overviewPageRoute),
  MenuItem(shiftsPageDisplayName, AppRoute.shiftsPageRoute),
  MenuItem(assetsPageDisplayName, AppRoute.assetsPageRoute),
  MenuItem(clientsPageDisplayName, AppRoute.clientsPageRoute),
  MenuItem(authenticationPageDisplayName, AppRoute.authenticationPageRoute),
];


