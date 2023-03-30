import 'package:flutter/material.dart';
import 'package:refrigerator_management_app/src/widgets/recommendationpage_widgets.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});
  
  @override
  RecommendationPageState createState() => RecommendationPageState();
}

class RecommendationPageState extends State<RecommendationPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 48.0, bottom: 80.0),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                GreetingWidget(),
                NotificationButton()
              ],
            ),
            const RecommendationListWidget(),
          ],
        ),
      )
    );
  }

}