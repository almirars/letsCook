import 'package:flutter/material.dart';
import 'package:lets_cook/kategori.dart';
import 'package:lets_cook/sign_in.dart';
import 'package:lets_cook/first_screen.dart';
import 'package:sign_button/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Let's Cook", 
              style: TextStyle(
                fontFamily: 'RalewayLight',
                fontSize: 50.0, 
                fontWeight: FontWeight.bold, 
                color: Colors.green,
              ),
            ),
              Container(
              child: Image(
                image: AssetImage("image/logo.png"),
                fit: BoxFit.contain,
                height: 250,
                width: 200,
              ),
            ),
            SizedBox(height: 20,),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      splashColor: Colors.grey,
      color: Colors.white,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return KategoriScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
