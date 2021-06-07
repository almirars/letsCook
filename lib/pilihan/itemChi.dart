import 'package:flutter/material.dart';

class ChineseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chinese"),
      ),
    );
  }
}

// final List West = [
//   "Chicken charsiu",
//   "Hainan Chicken Rice",
//   "Mapo Tofu",
//   "Fu Yung Hai",
//   "Kwetiau",
//   "Sapo Tahu",
//   "Dimsum",
//   "Mini Wonton",
//   "Wonton Soup",
//   "Bebek Peking",
// ];

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
