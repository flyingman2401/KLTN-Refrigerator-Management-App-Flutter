import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_management_app/src/data/data_structure.dart';
import '../features/sensors_features.dart';
import '../presentation/allfoodspage_page.dart';
import 'dart:ui' as ui;

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

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



class SensorDataGraph extends StatefulWidget {
  const SensorDataGraph({super.key});

  @override
  SensorDataGraphState createState() => SensorDataGraphState();
  
}

class SensorDataGraphState extends State<SensorDataGraph> {

  List<SensorsData> graphData = [];

  @override
  void initState() {
    super.initState();

    getSensorsDataList().then((value) {
      graphData = value;
      print(value);
      setState(() {});
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.Hms(),
        ),

        primaryYAxis: NumericAxis(
          title: AxisTitle(text:'Temperature'),
          majorGridLines: const MajorGridLines(width: 0),
          labelStyle: const TextStyle(
            color: Colors.red
          )
        ),

        axes: [
          NumericAxis(
            name:'yAxis',
            title: AxisTitle(text:'Humidity'),
            opposedPosition: true,
            majorGridLines: const MajorGridLines(width: 0),
            labelStyle: const TextStyle(
              color: Colors.green
            )
          )
        ],
        
        series: <SplineSeries<SensorsData, DateTime>>[
          SplineSeries<SensorsData, DateTime>(
            dataSource: graphData,
            width: 3,
            onCreateShader: (ShaderDetails details) {
              return ui.Gradient.linear(
                details.rect.topCenter,
                details.rect.bottomCenter,
                const [Colors.red, Colors.orange, Colors.yellow],
                [0.3, 0.6, 0.9]
              );
            },
            xValueMapper: (SensorsData data, _) => data.time,
            yValueMapper: (SensorsData data, _) => data.temp,
            markerSettings: const MarkerSettings(
              isVisible: true,
              color: Colors.red,
              borderColor: Colors.red
            )
          ),

          SplineSeries<SensorsData, DateTime>(
            dataSource: graphData,
            width: 3,
            onCreateShader: (ShaderDetails details) {
              return ui.Gradient.linear(
                details.rect.topCenter,
                details.rect.bottomCenter,
                const [Colors.blue, Colors.green, Colors.yellow],
                [0.3, 0.6, 0.9]
              );
            },
            xValueMapper: (SensorsData data, _) => data.time,
            yValueMapper: (SensorsData data, _) => data.humi,
            yAxisName: 'yAxis',
            markerSettings: const MarkerSettings(
              isVisible: true,
              color: Colors.green,
              borderColor: Colors.green
            )
          )
        ]
      )
    );
  }
}
