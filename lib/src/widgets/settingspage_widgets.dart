import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Title and notification icon widget for settings page

class SettingsPageTitle extends StatelessWidget {
  const SettingsPageTitle({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        'Tài khoản của tôi', 
        style: Theme.of(context).textTheme.titleLarge
      ),
    );
  }
  
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12.0),
      child: IconButton(
        icon: SvgPicture.asset(
          'lib/images/notification-bell.svg',
          color: Colors.black,
          width: 24,
          height: 24,
        ), 
        onPressed: () {  },
      ),
    );
  }
  
}

// Accounts and related information

class AccountImage extends StatelessWidget {
  const AccountImage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(48),
          child: Image.asset('lib/images/account_image.jpg')
        ),
    );
  }

}

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [ BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 15,
          blurRadius: 50,
          offset: const Offset(0, 0), // changes position of shadow
        )],
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start  ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AccountSettingsItem(),
          AccountSettingsItem(),
          AccountSettingsItem(),
          AccountSettingsItem(),
          AccountSettingsItem(),
        ],
      ),
    );
  }
  
}

class AccountSettingsItem extends StatelessWidget {
  const AccountSettingsItem({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [ BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 15,
          blurRadius: 50,
          offset: const Offset(0, 0), // changes position of shadow
        )],
      ),
      child: Row(
        children: [
          Container(
            width: 36.0,
            height: 36.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12.0)
            ),
            child: IconButton(
              icon: SvgPicture.asset('lib/images/home.svg'),
              onPressed: () => {},
            ),
          ),
          Text('Cài đặt ...')
        ],
      ),
    );
  }
  
}