import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lets_cook/screen/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return LoginPage(); //pergi ke halaman dashboard
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text("Let's Cook",
            style: TextStyle(
              fontFamily: 'RalewayLight',
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
      ),
    );
  }
}
