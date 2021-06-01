import 'package:flutter/material.dart';
import 'package:lets_cook/screen/login_page.dart';
import 'package:lets_cook/sign_in.dart';
import 'package:lets_cook/menu.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'pilihan/itemWestern.dart';
import 'pilihan/item.dart';
import 'pilihan/itemChi.dart';

class KategoriScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Cook"),
      ),
body: Center(
  child: Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(10.0),
      ),
      SizedBox(
        width: 300.0,
        height: 150.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
          color: Colors.green[200],
          child: Text('Indonesia', 
          style: TextStyle(
            fontSize: 40,
            fontFamily: "RalewayLight",
          ),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndonesiaScreen(),
                ));
          },
        ),
      ),
      Container(
        padding: EdgeInsets.all(10.0),
      ),
      SizedBox(
        width: 300.0,
        height: 150.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
          color: Colors.green[200],
          child: Text('Western', 
          style: TextStyle(
            fontSize: 40,
            fontFamily: "RalewayLight",
          ),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WesternScreen(),
                ));
          },
        ),
      ),
      Container(
        padding: EdgeInsets.all(10.0),
      ),
      SizedBox(
        width: 300.0,
        height: 150.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
          color: Colors.green[200],
          child: Text('Chinese', 
          style: TextStyle(
            fontSize: 40,
            fontFamily: "RalewayLight",
          ),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChineseScreen(),
                ));
          },
        ),
      )
    ],
  ),
)) ;
  }}