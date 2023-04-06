import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Title and notification icon widget for settings page

class SettingsPageTitle extends StatelessWidget {
  const SettingsPageTitle({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      'Cài đặt', 
      style: Theme.of(context).textTheme.titleLarge
    );
  }
  
}

// Accounts and related information

class AccountImage extends StatelessWidget {
  const AccountImage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [

        // Avatar with edit button
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            children: [
              const SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'lib/images/account_image.jpg',
                  ),
                )
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              )
              
            ],
          )
        ),

        // Name and description
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        Text(
          '@username', 
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          'vegetarian', 
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal
          ),
        )
      ]
    );
  }

}

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48 * 5 + 3 * (5 - 1),
      // padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15.0),
        // boxShadow: [ BoxShadow(
        //   color: Colors.black.withOpacity(0.1),
        //   spreadRadius: 15,
        //   blurRadius: 50,
        //   offset: const Offset(0, 0), // changes position of shadow
        // )],
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start  ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AccountSettingsItem(),
          Divider(
            color: Colors.white,
            height: 3.0,
            thickness: 2.0,
          ),
          AccountSettingsItem(),
          Divider(
            color: Colors.white,
            height: 3.0,
            thickness: 2.0,
          ),
          AccountSettingsItem(),
          Divider(
            color: Colors.white,
            height: 3.0,
            thickness: 2.0,
          ),
          AccountSettingsItem(),
          Divider(
            color: Colors.white,
            height: 3.0,
            thickness: 2.0,
          ),
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
    return InkWell( 
      onTap:() {
        print(1);
      },
      child: Ink(
        color: Colors.blue,
        child: Container(

      width: MediaQuery.of(context).size.width,
      height: 48,
      padding: EdgeInsets.all(6.0),
      // decoration: BoxDecoration(
      //   color: Colors.white.withOpacity(0.5),
      //   borderRadius: BorderRadius.circular(15.0),
      //   boxShadow: [ BoxShadow(
      //     color: Colors.black.withOpacity(0.1),
      //     spreadRadius: 15,
      //     blurRadius: 50,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   )],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
                ),
                padding: EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  'lib/images/home.svg',
                  width: 12.0,
                  height: 12.0,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
              ),
              const Text(
                'Cài đặt ...', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),

          SvgPicture.asset(
            'lib/images/toright.svg',
            width: 24.0,
            height: 24.0,
          )
        ],
      ),
    )
      )
    );
  }
  
}