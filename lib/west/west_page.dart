import 'package:flutter/material.dart';
import 'package:lets_cook/sign_in.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:lets_cook/database/dbHelper.dart';
import 'package:lets_cook/west/entryFormW.dart';
import 'package:lets_cook/west/west.dart';
import 'package:lets_cook/screen/home.dart';

//pendukung program asinkron
class WestPage extends StatefulWidget {
  // router untuk memanggil halaman ItemPage pada main
  static const WestP = '/westPage';
  @override
  WestPageState createState() => WestPageState();
}

class WestPageState extends State<WestPage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<ItemWest> itemList;
  @override
  Widget build(BuildContext context) {
    updateListView();
    if (itemList == null) {
      itemList = List<ItemWest>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Menu"),
              onPressed: () async {
                var item = await navigateToEntryForm(context, null);
                if (item != null) {
//TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertW(item);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<ItemWest> navigateToEntryForm(BuildContext context, ItemWest item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              // child: Icon(Icons.ad_units),
              child: Text(this.itemList[index].id.toString()),
            ),
            title: Text(
              this.itemList[index].menuW,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].bahanW),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
//TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                // dbHelper.delete(this.itemList[index].id);
                int result = await dbHelper.delete(this.itemList[index].id);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
//TODO 4 Panggil Fungsi untuk Edit data
              // dbHelper.update(item);
              int result = await dbHelper.updateW(item);
              if (result > 0) {
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

//update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<ItemWest>> itemListFuture = dbHelper.getItemListW(id);
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
