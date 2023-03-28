import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_management_app/src/data/data_structure.dart';
import 'package:refrigerator_management_app/src/features/sensors_features.dart';


// StatefulWidget of Home Page Temperature display widget

class HomePageTemperatureWidget extends StatefulWidget {
  const HomePageTemperatureWidget({super.key});

  @override
  HomePageTemperatureWidgetState createState() => HomePageTemperatureWidgetState();
}

class HomePageTemperatureWidgetState extends State<HomePageTemperatureWidget> {
  
  late Future<SensorsData> futureSensorsData;

  @override
  void initState() {
    super.initState();
    futureSensorsData = getSensorsDataRequest();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<SensorsData>(
            future: futureSensorsData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.temp);
              }
              else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// Display greetings to user widget

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({super.key});
  
  @override
  GreetingWidgetState createState() => GreetingWidgetState();
}

class GreetingWidgetState extends State<GreetingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24.0),
      child: Text('Chào, người dùng đầu tiên!', style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

// Notification Icon

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

// Show brief information about connected devices

class DeviceStatus extends StatefulWidget {
  const DeviceStatus({super.key});
  
  @override
  DeviceStatusState createState() => DeviceStatusState();
}

class DeviceStatusState extends State<DeviceStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      width: MediaQuery.of(context).size.width - 24,
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Tủ lạnh Samsung Evo II', style: Theme.of(context).textTheme.displayLarge,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text('Đã kết nối', style: Theme.of(context).textTheme.displaySmall),
              )
            ],
          ),
        ]
      )
    );
  }

}

class BriefInfoItemWidget extends StatefulWidget {
  const BriefInfoItemWidget({
    super.key,
    required this.iconLink,
    required this.label,
    required this.data,
    required this.unit,
    required this.mainColor,
    required this.hasVisualLayer
  });

  final String iconLink, label, unit;
  final int data;
  final Color mainColor;
  final bool hasVisualLayer;
  
  @override
  BriefInfoItemWidgetState createState() => BriefInfoItemWidgetState();
}

class BriefInfoItemWidgetState extends State<BriefInfoItemWidget> {
  @override
  Widget build(BuildContext context) {
    String displayData = (widget.data.toString()) + widget.unit;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        // Transparent background
        Container(
          width: (MediaQuery.of(context).size.width - 24 - 12*4) / 3,
          height: (210 - 24),
          margin: const EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30)
          )
        ),

        // Visual layer for data
        Container(
          width: (MediaQuery.of(context).size.width - 24 - 12*4) / 3,
          height: widget.hasVisualLayer ? ((210 - 24) / 100 * widget.data) : 0,
          padding: const EdgeInsets.only(bottom: 50.0, top: 24.0),
          margin: const EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
            color: widget.mainColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            )
          ),
        ),

        // Icon, label and statistic from sensors                
        Padding(
          padding: const EdgeInsets.only(
            top: 36,
            bottom: 48
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Group of icon and label    
              Column(children: [
                SvgPicture.asset(
                  widget.iconLink,
                  width: 24,
                  height: 24,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
                Text(widget.label, style: Theme.of(context).textTheme.labelMedium,),
              ]),
              
              // Statistic from sensors
              Text(displayData, style: Theme.of(context).textTheme.labelLarge,),
     
            ]
          ),
        )
              
      ],
    );
  }
}

class BriefInfoWidgetBottomLayer extends StatefulWidget {
  const BriefInfoWidgetBottomLayer({super.key});

  @override
  BriefInfoWidgetBottomLayerState createState() => BriefInfoWidgetBottomLayerState();
}

class BriefInfoWidgetBottomLayerState extends State<BriefInfoWidgetBottomLayer> {

  @override
  Widget build(BuildContext context) {
    return Container (
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.width) / 4 * 3 + 74,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('lib/images/fridgewithlight.webp'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter
        ),
        color: const Color(0xff1e1312),
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Align(
        alignment: Alignment.topCenter,
        child: DeviceStatus(),
      )
    );
  }

}

class BriefInfoWidget extends StatefulWidget {
  const BriefInfoWidget({super.key});

  @override
  BriefInfoWidgetState createState() => BriefInfoWidgetState();
}

class BriefInfoWidgetState extends State<BriefInfoWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height - 112 - 128 - 50),
      margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: const Color(0xff007cc8),
        boxShadow: [ BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 15,
          blurRadius: 50,
          offset: const Offset(0, 0), // changes position of shadow
        )],
      ),

      child: Stack(
        children: [

          // Bottom layer with image of frige and device connection status
          const BriefInfoWidgetBottomLayer(),

          // Circle color dot at bottom left and bottom right of the box
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(100.0)
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(100.0)
              ),
            )
          ),

          // Box contain the brief information of fridge
          Align(
            alignment: Alignment.bottomCenter,
            child: blurWidget(

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    BriefInfoItemWidget(
                      iconLink: 'lib/images/package.svg',
                      label: 'Dung tích',
                      data: 60,
                      unit: '%',
                      hasVisualLayer: true,
                      mainColor: Colors.blue,
                    ),
                    BriefInfoItemWidget(
                      iconLink: 'lib/images/temperature.svg',
                      label: 'Nhiệt độ',
                      data: 20,
                      unit: '\u00b0C',
                      hasVisualLayer: false,
                      mainColor: Colors.transparent,
                    ),
                    BriefInfoItemWidget(
                      iconLink: 'lib/images/battery.svg',
                      label: 'Pin thiết bị',
                      data: 40,
                      unit: '%',
                      hasVisualLayer: true,
                      mainColor: Colors.green,
                    ),
                  ]
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

    Widget blurWidget({
    required Widget child,
    double sigmaX = 15,
    double sigmaY = 15,
  }) => ClipRRect( 
    borderRadius: BorderRadius.circular(40),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY), 
      child: child,
    )
  );

}

// List of device's functions to interact with system

class DeviceFunctionItemWidget extends StatelessWidget {
  const DeviceFunctionItemWidget({
    super.key,
    required this.functionName, 
    required this.iconLink,
    required this.functionDescription,
    required this.mainColor,
    required this.secondColor,
    required this.textColor,
  });

  final String functionName;
  final String iconLink;
  final String functionDescription;
  final Color mainColor;
  final Color secondColor;
  final Color textColor;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 36) / 2,
      height: (MediaQuery.of(context).size.width - 36) / 2,
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72.0,
            height: 72.0,
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: SvgPicture.asset(
              iconLink,
              // ignore: deprecated_member_use
              color: mainColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                functionName, 
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                functionDescription, 
                style: TextStyle(
                  color: textColor.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          )
        ],
      ),
    );
  }
  
}

class DeviceFunctionsListWidget extends StatelessWidget {
  const DeviceFunctionsListWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.width - 12) / 2 * 2,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 15,
          blurRadius: 50,
          offset: const Offset(0, 0),
        )],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DeviceFunctionItemWidget(
                functionName: 'Quét QR',
                iconLink: 'lib/images/qrCode.svg',
                functionDescription: 'Quét QR để thêm hoặc bỏ thực phẩm.',
                mainColor: Colors.blueGrey,
                secondColor: Colors.white,
                textColor: Colors.white,
              ),
              DeviceFunctionItemWidget(
                functionName: 'Tất cả thực phẩm',
                iconLink: 'lib/images/package.svg',
                functionDescription: 'Xem tất cả thực phẩm đang có trong tủ lạnh.',
                mainColor: Colors.blue,
                secondColor: Colors.white,
                textColor: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DeviceFunctionItemWidget(
                functionName: 'Gợi ý món ăn',
                iconLink: 'lib/images/lightbulb.svg',
                functionDescription: 'Gợi ý món ăn dựa vào thực phẩm đang có.',
                mainColor: Colors.purple,
                secondColor: Colors.white,
                textColor: Colors.white,
              ),
              DeviceFunctionItemWidget(
                functionName: 'Xem tất cả',
                iconLink: 'lib/images/dashboard.svg',
                functionDescription: 'Xem chi tiết tất cả phần quản lý tủ lạnh.',
                mainColor: Colors.white,
                secondColor: Colors.black,
                textColor: Colors.black,
              ),
            ],
          ),
        ],
      )
    );
  }
}

// List of recommendation items

class RecommendationListWidget extends StatefulWidget {
  const RecommendationListWidget({super.key});

  @override
  RecommendationListWidgetState createState() => RecommendationListWidgetState();
  
}

class RecommendationListWidgetState extends State<RecommendationListWidget> {

  int _index = 0;

  List<Widget> pageList = List.from(const [
    RecommendationItemWidget(label: 'Bánh khọt', image: 'lib/images/recommendation/1.jpeg'),
    RecommendationItemWidget(label: 'Cá kho tộ', image: 'lib/images/recommendation/2.jpg'),
    RecommendationItemWidget(label: 'Bún nem rán', image: 'lib/images/recommendation/3.jpg'),
    RecommendationItemWidget(label: 'Bún bò', image: 'lib/images/recommendation/4.webp'),
    RecommendationItemWidget(label: 'Phở chay', image: 'lib/images/recommendation/5.webp'),
  ]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 260, // card height + indicator height
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: PageView.builder(
              itemCount: 5,
              controller: PageController(viewportFraction: 1.0),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _index ? 1 : 1,
                  child: pageList[i]
                );
              }
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5, (index) => buildDot(index)
              ),
            ),
          ),

        ],
      )
    
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: _index == index ? 18 : 8,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: _index == index ? Colors.black : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }

}

class RecommendationItemWidget extends StatefulWidget {
  const RecommendationItemWidget({
    super.key,
    required this.label, 
    required this.image,
  });
  
  final String label;
  final String image;

  @override
  RecommendationItemWidgetState createState() => RecommendationItemWidgetState();
  
}

class RecommendationItemWidgetState extends State<RecommendationItemWidget> {

  Color gradientColor1 = const Color.fromARGB(155, 0, 0, 0);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      height: 240,
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 24,
        height: 240 - 24,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientColor1,
              Colors.transparent,
              Colors.transparent
            ],
          ),
          borderRadius: BorderRadius.circular(30)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Đề xuất cho hôm nay', style: Theme.of(context).textTheme.displaySmall,),
            Text(widget.label, style: Theme.of(context).textTheme.displayMedium,)
          ],
        ),

      ),
    );
  }
  
}

