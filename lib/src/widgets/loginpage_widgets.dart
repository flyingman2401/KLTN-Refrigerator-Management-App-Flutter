// import 'package:flutter/material.dart';
// import 'package:refrigerator_management_app/src/features/user_features.dart';
// import 'package:refrigerator_management_app/src/data/data_structure.dart';


// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   LoginFormState createState() => LoginFormState();
// }

// class LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   String message = "HELLO"; // save token 

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // const HomePageTemperatureWidget(),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 16.0),),
//           TextFormField(
//             controller: email,
//             decoration: const InputDecoration(hintText: 'Enter your email address'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Email address can not be empty!';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             controller: password,
//             decoration: const InputDecoration(hintText: 'Enter your password'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Password can not be empty!';
//               }
//               return null;
//             },
//             obscureText: true,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false otherwise.
//                 if (_formKey.currentState!.validate()) {
//                   // If the form is valid, display a snackbar. In the real world,
//                   // you'd often call a server or save the information in a database.
//                   logIn(email.text, password.text).then((value) {
//                     message = value;
//                     setState(() {});

//                   });
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Doing")),
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//           Text(message), // Showing token key
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () async {
//                 // Validate returns true if the form is valid, or false otherwise.
//                 if (_formKey.currentState!.validate()) {
//                   // If the form is valid, display a snackbar. In the real world,
//                   // you'd often call a server or save the information in a database.

//                   bool refreshResponse = await refreshToken();
//                   if (refreshResponse == false) {
//                     // ignore: use_build_context_synchronously
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Failed to renew token :<")),
//                     );
//                   }
//                   else {
//                     // ignore: use_build_context_synchronously
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Renew token success!")),
//                     );
//                   }
//                 }
//               },
//               child: const Text('Authorize'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
