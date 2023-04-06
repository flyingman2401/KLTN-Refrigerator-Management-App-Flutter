import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/data_structure.dart';
import '../features/food_manage_features.dart';

class AllFoodsPage extends StatefulWidget {
  const AllFoodsPage({super.key});

  @override
  AllFoodsPageState createState() => AllFoodsPageState();
}

class AllFoodsPageState extends State<AllFoodsPage> {

  List<FoodQRCodeData> foodDataList = [];

  @override
  void initState() {
    super.initState();
    
    getFoodList().then((value) {
      foodDataList = value;
      setState(() {});
    },);
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),
            Row(
              children: [
                BackButton(
                  onPressed: () => Navigator.pop(context),
                ),
                Text('Thực phẩm hiện có')
              ],
            ),

            FoodListWidget(foodDataList: foodDataList)

            
          ],
        ),
      ),
    );
  }
  
}


class FoodItemWidget extends StatefulWidget {
  const FoodItemWidget({
    super.key,
    required this.foodData
  });

  final FoodQRCodeData foodData;
  
  @override
  FoodItemWidgetState createState() => FoodItemWidgetState();
}

class FoodItemWidgetState extends State<FoodItemWidget> {
  
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
                                    RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    
                    // Sản phẩm
                    const TextSpan(
                      text: 'Sản phẩm: ',
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: '${widget.foodData.foodName} \n',
                      style: const TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal
                      )
                    ),

                    // Nhà sản xuất
                    const TextSpan(
                      text: 'Nhà sản xuất: ',
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: '${widget.foodData.manufactureName} \n',
                      style: const TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal
                      )
                    ),
                    
                    // Ngày sản xuất
                    const TextSpan(
                              text: 'Ngày sản xuất: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${widget.foodData.productionDate} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                    
                    // Hạn sử dụng
                    const TextSpan(
                              text: 'Hạn sử dụng: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${widget.foodData.expirationDate} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                            
                    // Số lượng / Khối lượng
                    const TextSpan(
                              text: 'Số lượng: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${widget.foodData.amount} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                    
                    // Đơn vị tính
                    const TextSpan(
                              text: 'Đơn vị tính: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${widget.foodData.unit} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                  
                  ]
                ),
              ),
                      // Text("Title món ăn"),
                      // Text("Mô tả món ăn"),
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

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({
    super.key,
    required this.foodDataList
  });

  final List<FoodQRCodeData> foodDataList;

  @override
  FoodListWidgetState createState() => FoodListWidgetState();
}

class FoodListWidgetState extends State<FoodListWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 36,
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: widget.foodDataList.length,
        itemBuilder: (context, index) {
          print(widget.foodDataList[index].foodName);
          return FoodItemWidget(foodData: widget.foodDataList[index]);
        },
      )
    );
  }

}