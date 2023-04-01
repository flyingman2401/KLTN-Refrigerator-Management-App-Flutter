import 'package:flutter/material.dart';
import 'package:refrigerator_management_app/src/widgets/settingspage_widgets.dart';

class SettingspagePage extends StatelessWidget {
  const SettingspagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SettingsPageTitle(),
                NotificationButton(),
              ],
            ),
            const AccountImage(),
            const AccountSettings()
          ],
        ),
      ),
      
    );
  }
  
}