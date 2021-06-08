import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_cook/sign_in.dart';
import 'dart:async';
import 'package:lets_cook/database/dbHelper.dart';
import 'package:lets_cook/indo/entryForm.dart';
import 'package:lets_cook/indo/indo.dart';
import 'package:lets_cook/database/Database.dart';
import 'package:lets_cook/screen/home.dart';
import 'package:lets_cook/west/entryFormW.dart';
import 'package:lets_cook/west/west.dart';

//pendukung program asinkron
class WestPage extends StatefulWidget {
  // router untuk memanggil halaman ItemPage pada main
  static const WestP = '/westPage';
  final id;
  WestPage(this.id);
  @override
  WestPageState createState() => WestPageState();
}

class WestPageState extends State<WestPage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    String c = widget.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: Column(children: [
        Expanded(
          child: fireList(c),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Menu"),
              onPressed: () async {
                var item = await navigateToEntryFormW(
                    context, null, null, null, c, null);
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<ItemWest> navigateToEntryFormW(BuildContext context, String menu,
      String bahan, String caraBuat, String id, String docId) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormW(menu, bahan, caraBuat, id, docId);
    }));
    return result;
  }

  StreamBuilder fireList(String a) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;

    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItemsW(a),
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
                          await Database.deleteItemW(uid: a, docId: docID);
                    },
                  ),
                  onTap: () async {
                    var item = await navigateToEntryFormW(context, menu, bahan, caraBuat, a, docID);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
