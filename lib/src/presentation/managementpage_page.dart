import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/managementpage_widgets.dart';

class ManagementpagePage extends StatelessWidget {
  const ManagementpagePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: Text('Chào, Trung!', style: Theme.of(context).textTheme.titleLarge),
              ),
              Container(
                margin: const EdgeInsets.only(right: 24.0),
                child: IconButton(
                icon: SvgPicture.asset(
                    'lib/images/notification-bell.svg',
                    color: Colors.black,
                    width: 24,
                    height: 24,
                  ), 
                  onPressed: () {  },
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),

          const ViewAllFoods(),
          // const SensorDataGraph(),

        ]
      )),
      extendBody: true,
    );
  }
}

