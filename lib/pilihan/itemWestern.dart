import 'package:flutter/material.dart';

class WesternScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Western"),
      ),
    );
  }
}

//   final List West = [
//     "Chicken Cordon Bleu",
//     "Makaroni schotel",
//     "Spicy tuna roll",
//     "Lasagna",
//     "Beef wellington",
//     "Ratatoullie",
//     "Mushroom risotto",
//     "Potato gratin",
//     "Creamy chicken soup",
//     "Pasta marinara",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Western"),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return Card(
//               child: ListTile(
//             title: Text(West[index],
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontFamily: "RalewayLight",
//                 )),
//             // subtitle: Text(West[index] + ' enak banget '),
//             leading: CircleAvatar(
//               backgroundImage: AssetImage('image/logo.png'),
//               //   child: Text(Indonesia[index][0], // ambil karakter pertama text
//               //       style: TextStyle(fontSize: 20)),
//               // )
//             ),
//           ));
//         },
//         itemCount: West.length,
//       ),
//     );
//   }
// }
