import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_management_app/src/widgets/recommendationpage_widgets.dart';
import 'package:refrigerator_management_app/global_variables.dart' as global_variables;

import '../features/food_manage_features.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});
  
  @override
  RecommendationPageState createState() => RecommendationPageState();
}

class RecommendationPageState extends State<RecommendationPage> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 48.0, bottom: 80.0),
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
            IconButton(
              icon: SvgPicture.asset(
                'lib/images/refresh.svg',
                color: Colors.black,
              ),
              onPressed: () {
                updateRcmDishesList().then((value) {
                  setState(() {});
                },);
              }
            ),
            RecommendationListWidget(rcmDishDataList: global_variables.rcmDishesList),
          ],
        ),
      )
    );
  }
}