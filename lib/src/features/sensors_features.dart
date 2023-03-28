import 'package:refrigerator_management_app/src/data/data_structure.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var sensorsDataURL = 'https://kltn-refrigeratorapp.onrender.com/SensorsData';

Future<SensorsData> getSensorsDataRequest () async {
  var response = await http.get(
    Uri.parse(sensorsDataURL),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    return SensorsData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load sensors data!');
  }
}
