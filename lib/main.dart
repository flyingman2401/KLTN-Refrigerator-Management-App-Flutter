// Import functional library

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refrigerator_management_app/src/widgets/navigationbar_widget.dart';

// Import theme configuration files

import 'package:refrigerator_management_app/src/theme/homepage_theme.dart';

// Main program route

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const NavigationBarWidget(),
        theme: CustomTheme.customLightTheme,
      ),
    );
  }
}
