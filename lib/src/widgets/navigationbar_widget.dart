// Import functional library

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import presentation files that contain pages

import 'package:refrigerator_management_app/src/presentation/homepage_page.dart';
import 'package:refrigerator_management_app/src/presentation/managementpage_page.dart';
import 'package:refrigerator_management_app/src/presentation/qrcodescan_page.dart';
import 'package:refrigerator_management_app/src/presentation/recommendationpage_page.dart';
import 'package:refrigerator_management_app/src/presentation/settingspage_page.dart';

// Main Navigation Bar Widget

class  NavigationBarWidget extends StatefulWidget {
  const  NavigationBarWidget({Key? key}) : super(key: key);

  @override
  NavigationBarWidgetState createState() => NavigationBarWidgetState();
}

class NavigationBarWidgetState extends State<NavigationBarWidget> {

  var _currentIndex = 0;
  List<Widget> pages = List.from([
    const HomepagePage(),
    const ManagementpagePage(),
    const Text('Nopage'),
    const RecommendationPage(),
    const SettingspagePage()
  ]);

  @override
  Widget build(BuildContext context) {
    Color selectedIconColor = Colors.white;
    Color iconColor = Colors.black;
    return Scaffold(

      // Navigator on top of pages's content
      extendBody: true,

      // Floating QR Code button at docked center of navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'lib/images/qrCode.svg',
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              Text(
                'Quét QR',
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => QRCodeScanPage(),
                transitionDuration: const Duration(milliseconds: 30),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
              )
            );
          },
        )
      ),

      // Navigation bar with 4 buttons
      bottomNavigationBar: Container(

        width: MediaQuery.of(context).size.width,
        height: 72,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            spreadRadius: 10.0,
            blurRadius: 20.0
          )]
        ),

        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.white,
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (var newIndex) => setState(() {
              _currentIndex = newIndex;
            }),
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'lib/images/home.svg',
                  width: 20,
                  height: 20,
                  color: selectedIconColor,
                ),
                icon: SvgPicture.asset(
                  'lib/images/home.svg',
                  width: 20,
                  height: 20,
                  color: iconColor,
                ),
                label: 'Trang chủ',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'lib/images/dashboard.svg',
                  width: 20,
                  height: 20,
                  color: selectedIconColor,
                ),
                icon: SvgPicture.asset(
                  'lib/images/dashboard.svg',
                  width: 20,
                  height: 20,
                  color: iconColor,
                ),
                label: 'Quản lý',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                height: 72,
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'lib/images/lightbulb.svg',
                  width: 20,
                  height: 20,
                  color: selectedIconColor,
                ),
                icon: SvgPicture.asset(
                  'lib/images/lightbulb.svg',
                  width: 20,
                  height: 20,
                  color: iconColor,
                ),
                label: 'Gợi ý',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'lib/images/settings.svg',
                  width: 20,
                  height: 20,
                  color: selectedIconColor,
                ),
                icon: SvgPicture.asset(
                  'lib/images/settings.svg',
                  width: 20,
                  height: 20,
                  color: iconColor,
                ),
                label: 'Cài đặt',
              )
            ]
          ),
        ),
      ),
    
      // Content of selected item in navigation bar
      body: Container(
        child: pages[_currentIndex],
      ),
    
    );
  }
}