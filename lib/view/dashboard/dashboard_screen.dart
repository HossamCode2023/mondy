import 'package:chil_out/controller/dashboard_controller.dart';
import 'package:chil_out/view/account/account_screen.dart';
import 'package:chil_out/view/home/home_screen.dart';
import 'package:chil_out/view/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import '../share/share_screen.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return GetBuilder<DashboardController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: IndexedStack(
          index: dashboardController.tableIndex,
          children:  const [
            // ignore: prefer_const_constructors
            HomeScreen(),
            HistoryScreen(),
            ShareScreen(),
            AccountScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 0.7,
            ),
          ),
        ),
        child: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          unselectedLabelStyle: const TextStyle(fontSize: 11.0),
          snakeViewColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          showUnselectedLabels: true,
          currentIndex: dashboardController.tableIndex,
          onTap: (value) {
            dashboardController.upDateIndex(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.share),label: 'Share'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Account'),
          ],
        ),
      ),
    ),
    );
  }
}
