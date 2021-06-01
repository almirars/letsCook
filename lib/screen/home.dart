import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../model/carousel_model.dart';
import '../color.dart';
import '../widget/bottomNavigation.dart';
import '../pilihan/item.dart';
import '../pilihan/itemChi.dart';
import '../pilihan/itemWestern.dart';

class HomeScreen extends StatefulWidget {
  @override
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
              height: 190,
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
              height: 12,
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
            // indonesia
            Container(
              padding: EdgeInsets.all(10.0),
            ),
            SizedBox(
              width: 130.0,
              height: 70.0,
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
                        builder: (context) => IndonesiaScreen(),
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
              height: 70.0,
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
                        builder: (context) => WesternScreen(),
                      ));
                },
              ),
            ),

            //chinese
            Container(
              padding: EdgeInsets.all(10.0),
            ),
            SizedBox(
              width: 130.0,
              height: 70.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.green[200],
                child: Text(
                  'Chinese',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "RalewayLight",
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChineseScreen(),
                      ));
                },
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
