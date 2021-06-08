import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_cook/sign_in.dart';
import 'dart:async';
import 'package:lets_cook/database/dbHelper.dart';
import 'package:lets_cook/indo/entryForm.dart';
import 'package:lets_cook/indo/indo.dart';
import 'package:lets_cook/database/Database.dart';
import 'package:lets_cook/screen/home.dart';

//pendukung program asinkron
class IndoPage extends StatefulWidget {
  // router untuk memanggil halaman ItemPage pada main
  static const IndoP = '/indoPage';
  final id;
  IndoPage(this.id);
  @override
  IndoPageState createState() => IndoPageState();
}

class IndoPageState extends State<IndoPage> {
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
                var item = await navigateToEntryForm(
                    context, null, null, null, c, null);
                // var item = await navigateToEntryForm(
                //       //       context, null, null, null, null, a);
                if (item != null) {
//TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insert(item);
                  if (result > 0) {
                  }
                }
              },
            ),
          ),
        ),
      ]),
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
}
