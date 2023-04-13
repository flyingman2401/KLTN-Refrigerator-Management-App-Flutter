import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:refrigerator_management_app/global_variables.dart' as global_variables;
import '../data/data_structure.dart';

// Add ingredient data using HTTP POST method

Future<bool> addIngredient (String qrCodeData, String userID, bool onFreezer) async {

  FoodQRCodeData jsonDecodeData = FoodQRCodeData.fromJson(json.decode(qrCodeData));
  var data = {
    "ingredient_id": jsonDecodeData.ingredientID,
    "user_id": userID,
    "food_manufacture": jsonDecodeData.foodManufacture,
    "food_PRD": jsonDecodeData.foodPRD.toString(),
    "food_EXP": jsonDecodeData.foodEXP.toString(),
    "food_amount": jsonDecodeData.foodAmount,
    "food_unit": jsonDecodeData.foodUnit,
    "food_onFreezer": onFreezer
  };

  final response = await http.post(
    Uri.parse(global_variables.foodManagementURL),
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

// Remove ingredient data using HTTP DELETE method

Future<bool> removeIngredient (String qrCodeData, String userID) async {

  FoodQRCodeData jsonDecodeData = FoodQRCodeData.fromJson(json.decode(qrCodeData));
  var data = {
    "ingredient_id": jsonDecodeData.ingredientID,
    "user_id": userID
  };

  final response = await http.delete(
    Uri.parse(global_variables.foodManagementURL),
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

// Get ingredient list inside fridge using HTTP GET method, action = 1

Future<void> updateFridgeIngredientList () async {
  global_variables.fridgeIngredientList = [];

  var response = await http.get(
    Uri.parse("${global_variables.foodManagementURL}?action=1"),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    var jsonArray = json.decode(response.body);
    for (var i = 0; i < jsonArray.length; i++) {
      IngredientInsideFridge item = IngredientInsideFridge.fromJson(jsonArray[i]);
      global_variables.fridgeIngredientList.add(item);
    }
  }
}

// Get recommendation dishes list using HTTP GET method, action = 2

Future<void> updateRcmDishesList () async {
  global_variables.rcmDishesList = [];

  var response = await http.get(
    Uri.parse("${global_variables.foodManagementURL}?action=2"),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    final jsonArray = json.decode(response.body);
    for (var i = 0; i < jsonArray.length; i++) {
      RecommendationDish item = RecommendationDish.fromJson(jsonArray[i]);
      global_variables.rcmDishesList.add(item);
    }
  }
}