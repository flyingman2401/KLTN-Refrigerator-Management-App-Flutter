import 'package:flutter/material.dart';
import 'package:refrigerator_management_app/src/widgets/settingspage_widgets.dart';
import 'package:refrigerator_management_app/src/widgets/homepage_widgets.dart';

class SettingspagePage extends StatelessWidget {
  const SettingspagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SettingsPageTitle(),
                  NotificationButton(),
                ],
              ),
            ),
            
            const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
            const Center(
              child: AccountImage(),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0),
              child: Text('Cài đặt tài khoản', style: Theme.of(context).textTheme.titleMedium,),
            ),

            const AccountSettings(),

            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0),
              child: Text('Cài đặt ứng dụng', style: Theme.of(context).textTheme.titleMedium,),
            ),
            const AccountSettings(),

            // Padding for the end of the page
            const Padding(padding: EdgeInsets.symmetric(vertical: 60.0)),
          ],
        ),
      ),
      
    );
  }
  
}

