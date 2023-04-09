import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_management_app/src/widgets/recommendationpage_widgets.dart';

import '../data/data_structure.dart';
import '../features/food_manage_features.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});
  
  @override
  RecommendationPageState createState() => RecommendationPageState();
}

class RecommendationPageState extends State<RecommendationPage> {

  List<RcmDishData> rcmDishDataList = [];

  @override
  void initState() {
    super.initState();
    
    getRcmDishList().then((value) {
      rcmDishDataList = value;
      setState(() {});
    },);
  }

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
            IconButton(
              icon: SvgPicture.asset(
                'lib/images/home.svg',
                color: Colors.black,
              ),
              onPressed: () {
                getRcmDishList().then((value) {
                rcmDishDataList = value;
                setState(() {});
              },);
              }
            ),
            RecommendationListWidget(rcmDishDataList: rcmDishDataList),
          ],
        ),
      )
    );
  }

}