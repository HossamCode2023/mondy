import 'package:flutter/material.dart';

import '../view/assets_petrol/assets.dart';
import '../view/clients/clients.dart';
import '../view/overview/overview.dart';
import '../view/shifts/shifts.dart';
import 'app_route.dart';

//*======== Function to take RoutesSettings and return page route
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.overviewPageRoute:
      return _getPageRoute(const OverviewPage());
    case AppRoute.shiftsPageRoute:
      return _getPageRoute(const ShiftsPage());
    case AppRoute.assetsPageRoute:
      return _getPageRoute(const AssetsPage());
    case AppRoute.clientsPageRoute:
      return _getPageRoute(const ClientsPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

//*======== Function to  return page route

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
