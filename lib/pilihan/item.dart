// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lets_cook/database/Database.dart';
// import 'package:lets_cook/database/dbHelper.dart';
// import 'package:lets_cook/model/item.dart';
// import 'package:lets_cook/screen/entryForm.dart';

// class IndonesiaScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String a;
//     final User userArgs = ModalRoute.of(context).settings.arguments;
//     if (userArgs != null) {
//       a = userArgs.uid;
//     }

//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Indonesia"),
//         ),
//         body: Column(children: [
//           Expanded(
//             child: fireList(a),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 10),
//             child: FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () async {
//                 var item = await navigateToEntryForm(
//                     context, null, null, null, a, null);
//               },
//             ),
//           ),
//         ]));
//   }
// }

// Future<Database> navigateToEntryForm(BuildContext context, Item item,
//     String menu, String bahan, String caraBuat, String id) async {
//   var result = await Navigator.push(context,
//       MaterialPageRoute(builder: (BuildContext context) {
//     return EntryForm(item, menu, bahan, caraBuat, id);
//   }));
//   return result;
// }

// StreamBuilder fireList(String a) {
//     TextStyle textStyle = Theme.of(context).textTheme.headline5;
//   return StreamBuilder<QuerySnapshot>(
//     stream: Database().readItems(a),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) {
//         return Container(
//             alignment: Alignment.center,
//             child:
//                 Text('Loading', style: TextStyle(fontWeight: FontWeight.bold)));
//       } else if (snapshot.hasData || snapshot.data != null) {
//         return ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             var noteInfo = snapshot.data.docs[index].data();
//             String docID = snapshot.data.docs[index].id;
//             String name = noteInfo['nama'];
//             int price = noteInfo['bahan'];
//             int stock = noteInfo['caraBuat'];

//             return Card(
//               color: Colors.white,
//               elevation: 2.0,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   child: Icon(Icons.cake_rounded),
//                 ),
//                 title: Text(
//                   name,
//                   style: textStyle,
//                 ),
//                 subtitle: Text(stock.toString()),
//                 trailing: GestureDetector(
//                     child: DropdownButton<String>(
//                       underline: SizedBox(),
//                       icon: Icon(Icons.menu),
//                       items: list  Buku.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String changeValue) async {
//                         if (changeValue == "Delete") {
//                           Database.deleteItem(uid: a, docId: docID);
//                         } else if (changeValue == "Update") {
//                           await navigateToEntryForm(
//                               context, menu, bahan, caraBahan, a, docID);
//                         }
//                         ;
//                       },
//                     ),
//                   ),

//               ),
//             );
//           },
//         );
//       }
//     },
//   );
// }
// void updateListView() {
//     final Future<Database> dbFuture = DbHelper.initDb();
//     dbFuture.then((database) {
// //TODO 1 Select data dari DB
//       Future<List<Item>> supplierListFuture = DbHelper.getSupplierList();
//       supplierListFuture.then((suppList) {
//         setState(() {
//           this.suppList = suppList;
//           this.count = suppList.length;
//         });
//       });
//     });
//   }

// //   final List Indonesia = [
// //     "Sate",
// //     "Pempek",
// //     "Gudeg",
// //     "Martabak",
// //     "Kerak Telor",
// //     "Ayam Taliwang",
// //     "Krengsengan",
// //     "Rendang",
// //     "Rawon",
// //     "Soto",
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Indonesia"),
// //       ),
// //       body: ListView.builder(
// //         itemBuilder: (context, index) {
// //           return Card(
// //               child: ListTile(
// //             title: Text(Indonesia[index],
// //                 style: TextStyle(
// //                   fontSize: 25,
// //                   fontFamily: "RalewayLight",
// //                 )),
// //             // subtitle: Text(Indonesia[index] + ' enak banget '),
// //             leading: CircleAvatar(
// //               backgroundImage: AssetImage('image/logo.png'),
// //               //   child: Text(Indonesia[index][0], // ambil karakter pertama text
// //               //       style: TextStyle(fontSize: 20)),
// //               // )
// //             ),
// //           ));
// //         },
// //         itemCount: Indonesia.length,
// //       ),
// //     );
// //   }
// // }
