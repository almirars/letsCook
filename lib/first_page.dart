import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_cook/screen/login_page.dart';
import 'package:lets_cook/database/Database.dart';
import 'package:lets_cook/database/dbHelper.dart';
import 'package:lets_cook/indo/indo.dart';
import 'package:lets_cook/indo/entryForm.dart';


class FirstPage extends StatefulWidget {
  @override
  static String tag = 'first-page';
  final id;
  FirstPage(this.id);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<ItemIndo> itemList;
  @override
  Widget build(BuildContext context) {
  String c = widget.id;
    if (itemList == null) {
      itemList = List<ItemIndo>();
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Floating Action Button'),
      // ),
      // body: const Center(child: Text('Press the button below!')),

      body: Column(
         children: [
        //    Expanded(
        //   child: fireList(c),
        // ),
          Container(
          margin : EdgeInsets.fromLTRB(16, 30, 16, 8),
          width: 600,
          child: Text(
            'Mau makan apa hari ini?',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'RalewayLight',
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: const Icon(Icons.meeting_room),
        backgroundColor: Colors.green,
      ),
    );
  }

  StreamBuilder fireList(String a) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;

    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(a),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              alignment: Alignment.center,
              child: Text('Loading',
                  style: TextStyle(fontWeight: FontWeight.bold)));
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data.docs[index].data();
              String docID = snapshot.data.docs[index].id;
              String menu = noteInfo['menu'];
              String bahan = noteInfo['bahan'];
              String caraBuat = noteInfo['caraBuat'];

              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  title: Text(
                    menu,
                    style: textStyle,
                  ),
                  subtitle: Text(bahan + "\n" + caraBuat),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () async {
                          await Database.deleteItem(uid: a, docId: docID);
                    },
                  ),
                  onTap: () async {
                    var item = await navigateToEntryForm(context, menu, bahan, caraBuat, a, docID);
                    int result = await dbHelper.update(item);
                    if (result > 0) {
                    }
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
  Future<ItemIndo> navigateToEntryForm(BuildContext context, String menu,
      String bahan, String caraBuat, String id, String docId) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(menu, bahan, caraBuat, id, docId);
    }));
    return result;
  }
}
