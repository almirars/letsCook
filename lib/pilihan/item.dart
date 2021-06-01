import 'package:flutter/material.dart';

class IndonesiaScreen extends StatelessWidget {
  final List Indonesia = [
    "Sate",
    "Pempek",
    "Gudeg",
    "Martabak",
    "Kerak Telor",
    "Ayam Taliwang",
    "Krengsengan",
    "Rendang",
    "Rawon",
    "Soto",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indonesia"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(Indonesia[index],
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "RalewayLight",
                )),
            // subtitle: Text(Indonesia[index] + ' enak banget '),
            leading: CircleAvatar(
              backgroundImage: AssetImage('image/logo.png'),
              //   child: Text(Indonesia[index][0], // ambil karakter pertama text
              //       style: TextStyle(fontSize: 20)),
              // )
            ),
          ));
        },
        itemCount: Indonesia.length,
      ),
    );
  }
}
