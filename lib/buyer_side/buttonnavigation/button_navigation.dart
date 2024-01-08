// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../../color/color.dart';
import '../account/my_account.dart';
import '../basket/basket.dart';
import '../home/home_page.dart';
import '../my_orders/my_order.dart';

class Button_navigation extends StatefulWidget {
  const Button_navigation({super.key});
  @override
  State<Button_navigation> createState() => _Button_navigationState();
}
class _Button_navigationState extends State<Button_navigation> {
  int _currentPageIndex = 0; // Track the current page index
  final List<Widget> _pages = [
    HomePage(),
    Basket(),
    MyOrder(),
    Setting_screen(),
    // Profile(),
  ];
  ColorSelect colorObj = ColorSelect();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: [
          "Home",
          "Catagories",
          "My Order",
          "Profile",
        ],
        icons: const [
          Icons.home,
          Icons.grid_view,
          Icons.history_outlined,

          Icons.person,
          //  Icons.search,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: colorObj.pruple,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: colorObj.pruple,
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color(0xFFAFAFAF),
        onTabItemSelected: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
