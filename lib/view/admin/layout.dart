// import 'package:chil_out/widget/large_screen.dart';
// ignore_for_file: use_key_in_widget_constructors

import 'package:chil_out/widget/large_screen.dart';
import 'package:flutter/material.dart';

import '../../helper/responsive_screen.dart';
import '../../widget/side_menu.dart';
import '../../widget/small_screen.dart';
import '../../widget/top_nav.dart';

class SiteLayout extends StatelessWidget {
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
        appBar: topNavigationBar(context, scaffoldKey),
        drawer: const Drawer(
          child: SideMenu(),
        ),
        body: const ResponsiveWidget(largeScreen: LargeScreen(),smallScreen: SmallScreen()),
      );
  }
}