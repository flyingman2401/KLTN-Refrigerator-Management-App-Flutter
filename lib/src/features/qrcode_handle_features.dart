import 'dart:convert';
import 'package:http/http.dart' as http;

var foodManagementURL = 'https://kltn-refrigeratorapp.onrender.com/FoodManagement';

Future<bool> addFood (String qrCodeData) async {

  var data = {
    "action" : 0,
    "data" : qrCodeData
  };

  final response = await http.post(
    Uri.parse(foodManagementURL),
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*'
    },
    body: jsonEncode(data)
  );

  if (response.statusCode == 200) {
    return true;
  }
  else {
    return false;
  }
}

Future<bool> removeFood (String qrCodeData) async {

  var data = {
    "action" : 1,
    "data" : qrCodeData
  };

  final response = await http.post(
    Uri.parse(foodManagementURL),
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*'
    },
    body: jsonEncode(data)
  );

  if (response.statusCode == 200) {
    return true;
  }
  else {
    return false;
  }
}

