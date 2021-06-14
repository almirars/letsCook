import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lets_cook/indo/indo_page.dart';
import 'package:lets_cook/sign_in.dart';
import 'package:lets_cook/west/west_page.dart';
import '../model/carousel_model.dart';
import '../color.dart';
import '../widget/bottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  static String tag = 'home-page';
  final id;
  HomeScreen(this.id);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String a;
    final User userArgs = ModalRoute.of(context).settings.arguments;
    if (userArgs != null) {
      a = userArgs.uid;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Cook"),
      ),

      bottomNavigationBar: BottomNavigationLetsCook(),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => AddScreen(),
      //       ),
      //     );
      //   },
      //   backgroundColor: CustomColors.firebaseOrange,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 32,
      //   ),
      // ),

      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 16, right: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Swiper(
                onIndexChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                autoplay: true,
                layout: SwiperLayout.DEFAULT,
                itemCount: carousels.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(
                            carousels[index].image,
                          ),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: map<Widget>(carousels, (index, image) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      height: 6,
                      width: 6,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? mBlueColor : mGreyColor),
                    );
                  }),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
            ),
            new Text(
              'Mau masak apa hari ini?',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "RalewayLight",
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // indonesia
                  Container(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    width: 130.0,
                    height: 90.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.green[200],
                      child: Text(
                        'Indonesia',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "RalewayLight",
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IndoPage(id),
                            ));
                      },
                    ),
                  ),
                  // western
                  Container(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    width: 130.0,
                    height: 90.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.green[200],
                      child: Text(
                        'Western',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "RalewayLight",
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WestPage(id),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
