import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chào, người dùng!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Gợi ý món ăn phù hợp dành cho bạn',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      )
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
          // ignore: deprecated_member_use
          color: Colors.black,
          width: 24,
          height: 24,
        ), 
        onPressed: () {  },
      ),
    );
  }
  
}

class RecommendationItemWidget extends StatefulWidget {
  const RecommendationItemWidget({super.key});
  
  @override
  RecommendationItemWidgetState createState() => RecommendationItemWidgetState();
}

class RecommendationItemWidgetState extends State<RecommendationItemWidget> {
  @override
  Widget build(BuildContext context) {
    Color gradientColor1 = Colors.white.withOpacity(0.5);
    Color gradientColor2 = Colors.white.withOpacity(0.8);
    Color gradientColor3 = Colors.white.withOpacity(1);
    return Container(
      width: MediaQuery.of(context).size.width - 24.0,
      height: 180,
      margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 15,
          blurRadius: 50,
          offset: const Offset(0, 0),
        )],
      ),
      child: Stack(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 24.0) / 2  ,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/images/recommendation/3.jpg'
                ),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(30.0)
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 24.0),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  gradientColor1,
                  gradientColor2,
                  gradientColor3,
                  gradientColor3,
                  gradientColor3,
                  gradientColor3,
                  gradientColor3,
                ]
              )
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 24.0),
            height: 180,
            child: Row(
              children: [
                const Expanded(
                  flex: 2, child: SizedBox(
                    height: 180,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title món ăn"),
                      Text("Mô tả món ăn"),
                      Row(
                        children: [
                          // Like button
                          IconButton(
                            icon: SvgPicture.asset('lib/images/home.svg', color: Colors.black,),
                            onPressed: () => {},
                          ),
                          // Dislike button
                          IconButton(
                            icon: SvgPicture.asset('lib/images/home.svg', color: Colors.black,),
                            onPressed: () => {},
                          ),
                          // Xem chi tiết button
                          IconButton(
                            icon: SvgPicture.asset('lib/images/home.svg', color: Colors.black,),
                            onPressed: () => {},
                          )
                        ],
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }

}

class RecommendationListWidget extends StatefulWidget {
  const RecommendationListWidget({super.key});

  @override
  RecommendationListWidgetState createState() => RecommendationListWidgetState();
}

class RecommendationListWidgetState extends State<RecommendationListWidget> {

  List<RecommendationItemWidget> foodRecommendation = List.from([
    const RecommendationItemWidget(),
    const RecommendationItemWidget(),
    const RecommendationItemWidget(),
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 3 * 200,
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return foodRecommendation[index];
        },
      )
    );
  }

}