import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/data_structure.dart';

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

Future<List<FoodQRCodeData>> getFoodList () async {

  List<FoodQRCodeData> foodDataList = [];

  foodManagementURL = "$foodManagementURL?action=2";

  var response = await http.get(
    Uri.parse(foodManagementURL),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {

    var jsonResponse = AllFoodData.fromJson(json.decode(response.body));
  
    for (var i = 0; i < jsonResponse.foodCount; i++) {
      FoodQRCodeData foodItem = FoodQRCodeData.fromJson(jsonResponse.data[i]);
      foodDataList.add(foodItem);
    }

  }

  return Future.value(foodDataList);

}

Future<List<RcmDishData>> getRcmDishList () async {

  List<RcmDishData> rcmDishesList = [];

  var response = await http.get(
    Uri.parse("$foodManagementURL?action=3"),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {

    final jsonArray = json.decode(response.body);
    final itemCount = jsonArray.length;
    for (var i = 0; i < itemCount; i++) {
      RcmDishData rcmDishItem = RcmDishData.fromJson(jsonArray[i]);
      rcmDishesList.add(rcmDishItem);
    }

  }
  return Future.value(rcmDishesList);

}