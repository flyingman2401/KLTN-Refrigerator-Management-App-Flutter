// import 'package:http/http.dart' as http;
// import 'package:refrigerator_management_app/src/data/data_structure.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:refrigerator_management_app/main.dart';

// var logInURL = "https://kltn-refrigeratorapp.onrender.com/login";
// var signUpURL = "https://kltn-refrigeratorapp.onrender.com/login";

// Future<String> logIn (String email, String password) async {
//   String basicAuthData = base64.encode(utf8.encode('$email:$password'));
//   final response = await http.get(
//     Uri.parse(logInURL),
//     headers: <String, String> {
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Basic $basicAuthData'
//     },
//   );

//   if (response.statusCode == 201) {
//     var data = LoginResponseData.fromJson(json.decode(response.body));
//     String storageResponse = await saveUserToken(data.token);

//     return Future.value(storageResponse);
//   } else {
//     return Future.value("Wrong Input!");
//   }
// }

// Future<String> saveUserToken(String token) async {
//   await secureStorage.delete(key: 'token');
//   await secureStorage.write(key: 'token', value: token);

//   print(token);

//   String? secureStorageData = await secureStorage.read(key: 'token');
//   if (secureStorageData == token) {
//     return Future.value("Stored token!");
//   }
//   return Future.value("Store token failed!");

// }

// Future<String> signUp (data) async {
//   final response = await http.post(
//     Uri.parse(signUpURL),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(data)
//   );

//   if (response.statusCode == 201) {
//     return Future.value("Tao tai khoan thanh cong!");
//   } else if (response.statusCode == 202) {
//     return Future.value("Da ton tai nguoi dung!");
//   } else {
//     return Future.value("Khong the tao tai khoan!");
//   }
    
// }

// Future<bool> refreshToken () async {
//   String? token = await secureStorage.read(key: 'token');
//   if (token == null) {
//     return false;
//   }
  
//   final response = await http.get(
//     Uri.parse(logInURL),
//     headers: <String, String> {
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer $token'
//     },
//   );

//   if (response.statusCode == 200) {
//     print(response.headers);
//     // print(response.headers.get('Authorization'));
//     return Future<bool>.value(true);
//   } 
//   else {
//     return Future<bool>.value(false);
//   }
// }
