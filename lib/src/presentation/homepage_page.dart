import 'package:flutter/material.dart';
import 'package:refrigerator_management_app/src/widgets/homepage_widgets.dart';

class HomepagePage extends StatelessWidget {
  const HomepagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox (
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Set vertical offset where contents begin
            const Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),

            // Greeting widget and notification button in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                GreetingWidget(),
                NotificationButton(),
              ],
            ),

            // BODY Part 1: Brief information of connected device  
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0),
              child: Text('Thiết bị của bạn (1)', style: Theme.of(context).textTheme.titleMedium,),
            ),
            const BriefInfoWidget(),

            // BODY Part 2: Significant features for device management
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0),
              child: Text('Quản lý thiết bị', style: Theme.of(context).textTheme.titleMedium,),
            ),
            const DeviceFunctionsListWidget(),

            // BODY Part 3: List of the most suitable 5 dishes for the day
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0),
              child: Text('Dành cho bạn', style: Theme.of(context).textTheme.titleMedium,),
            ),
            const RecommendationListWidget(),

            // Padding for the end of the page
            const Padding(padding: EdgeInsets.symmetric(vertical: 60.0)),
              
          ]
        ))
      ),
    );
  }

}