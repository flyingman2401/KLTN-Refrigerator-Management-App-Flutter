import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../presentation/allfoodspage_page.dart';

class ViewAllFoods extends StatefulWidget {
  const ViewAllFoods({super.key});
  
  @override
  ViewAllFoodsState createState() => ViewAllFoodsState();
}

class ViewAllFoodsState extends State<ViewAllFoods> {

  void _showDialog () {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Column(
                children: [
                  BackButton(
                    onPressed: () => Navigator.pop(context, true),
                  )
                ],
              ),
            )
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'lib/images/home.svg',
        width: 48,
        height: 48,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllFoodsPage()));
      },
    );
    
  }

}