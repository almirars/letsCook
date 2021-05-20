import 'package:flutter/material.dart';
import 'package:lets_cook/login_page.dart';
import 'package:lets_cook/sign_in.dart';
import 'package:lets_cook/menu.dart';

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
            RaisedButton(
              child: Text('Kategori 1'),
              onPressed: (){
                Navigator.push(
                context, 
                MaterialPageRoute
                  (builder: (context) => MenuScreen(),
                ));
              },
            )
          ],
        ),
      )
    );
  }
}
