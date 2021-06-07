import 'package:flutter/material.dart';
import 'package:lets_cook/indo/indo.dart';

class EntryForm extends StatefulWidget {
  final ItemIndo item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  ItemIndo item;
  EntryFormState(this.item);
  TextEditingController menuController = TextEditingController();
  TextEditingController bahanController = TextEditingController();
  TextEditingController caraBuatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//kondisi
    if (item != null) {
      menuController.text = item.menu;
      bahanController.text = item.bahan;
      caraBuatController.text = item.caraBuat;
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
                  controller: menuController,
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
                  controller: bahanController,
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
                  controller: caraBuatController,
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
                            item = ItemIndo(
                                menuController.text,
                                bahanController.text,
                                caraBuatController.text,);
                          } else {
// ubah data
                            item.menu = menuController.text;
                            item.bahan = bahanController.text;
                            item.caraBuat = bahanController.text;
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
