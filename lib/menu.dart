// import 'package:flutter/material.dart';
// import 'package:lets_cook/login_page.dart';
// import 'package:lets_cook/sign_in.dart';
// import 'indo.dart';
// import 'pilihan/item.dart';
// import 'pilihan/itemWestern.dart';

// class MenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Indonesia"),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(10.0),
//                 // color: Colors.black,
//               ),
//               SizedBox(
//                 width: 150.0,
//                 height: 150.0,
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   color: Colors.green[200],
//                   child: Text(
//                     'Lumpia',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: "RalewayLight",
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => IndonesiaScreen(),
//                         ));
//                   },
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10.0),
//                 // color: Colors.black,
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   signOutGoogle();

//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(builder: (context) {
//                     return LoginPage();
//                   }), ModalRoute.withName('/'));
//                 },
//                 color: Colors.green[600],
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Sign Out',
//                     style: TextStyle(fontSize: 25, color: Colors.white),
//                   ),
//                 ),
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40)),
//               )
//             ],
//           ),
//         ));
//   }
// }
