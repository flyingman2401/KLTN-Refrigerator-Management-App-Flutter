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
