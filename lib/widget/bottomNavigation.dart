import 'package:flutter/material.dart';
import 'package:lets_cook/color.dart';
import 'package:lets_cook/kategori.dart';
import 'package:lets_cook/sign_in.dart';
import 'package:lets_cook/screen/login_page.dart';

class BottomNavigationLetsCook extends StatefulWidget {
  @override
  _BottomNavigationLetsCookState createState() =>
      _BottomNavigationLetsCookState();
}

class _BottomNavigationLetsCookState extends State<BottomNavigationLetsCook> {
  final _halaman = [
    LoginPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      // child: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmarks),
      //       title: Text('Recipe'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.logout),
      //       title: Text('Logout'),
      //     )
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   type: BottomNavigationBarType.fixed,
      //   showUnselectedLabels: true,
      //   elevation: 0,
      // ),
      child: BottomNavigationBar(
        onTap: (index) {
          signOutGoogle();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), ModalRoute.withName('/'));
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            title: Text('Log Out'),
          )
        ],
      ),
    );
  }
}
