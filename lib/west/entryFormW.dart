import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lets_cook/west/west.dart';

class EntryForm extends StatefulWidget {
  final ItemWest item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  ItemWest item;
  EntryFormState(this.item);
  TextEditingController menuWController = TextEditingController();
  TextEditingController bahanWController = TextEditingController();
  TextEditingController caraBuatWController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//kondisi
    if (item != null) {
      menuWController.text = item.menuW;
      bahanWController.text = item.bahanW;
      caraBuatWController.text = item.caraBuatW;
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: item == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: menuWController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Masakan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: bahanWController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Bahan Masakan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),

// stok
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: caraBuatWController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Cara Membuat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),

// tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
// tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (item == null) {
// tambah data
                            item = ItemWest(
                                menuWController.text,
                                bahanWController.text,
                                caraBuatWController.text,);
                          } else {
// ubah data
                            item.menuW = menuWController.text;
                            item.bahanW = bahanWController.text;
                            item.caraBuatW = caraBuatWController.text;
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, item);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
// tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
