import 'package:flutter/material.dart';
import 'screen/login_page.dart';
import 'screen/home.dart';

void main() => runApp(MyApp());   

class MyApp extends StatelessWidget {
  @override

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomeScreen.tag: (context) => HomeScreen(),
  };

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
