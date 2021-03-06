import 'package:flutter/material.dart';
import 'package:lets_cook/sign_in.dart';
import 'screen/login_page.dart';
import 'screen/home.dart';
import 'package:lets_cook/splashScreen.dart';

void main() => runApp(MyApp());   

class MyApp extends StatelessWidget {
  @override

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomeScreen.tag: (context) => HomeScreen(id),
  };

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreenPage(),
      routes: routes,
    );
  }
}
