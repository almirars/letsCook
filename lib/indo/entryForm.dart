import 'package:flutter/material.dart';
import 'package:lets_cook/database/Database.dart';

class EntryForm extends StatefulWidget {
  final String menu;
  final String bahan;
  final String caraBuat;
  final String id;
  final String docId;
  EntryForm(this.menu, this.bahan, this.caraBuat, this.id, this.docId);
  @override
  EntryFormState createState() => EntryFormState(this.menu, this.bahan, this.caraBuat, id, docId);
}

class EntryFormState extends State<EntryForm> {
  String menu;
  String bahan;
  String caraBuat;
  String id;
  String docId;
  EntryFormState(this.menu, this.bahan, this.caraBuat, this.id,this.docId);
  TextEditingController menuController = TextEditingController();
  TextEditingController bahanController = TextEditingController();
  TextEditingController caraBuatController = TextEditingController();


  @override
  Widget build(BuildContext context) {
//kondisi
    if (menu != null) {
      menuController.text = menu;
      bahanController.text = bahan;
      caraBuatController.text = caraBuat;
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu') ,
          // Text('Tambah') : Text('Ubah'),
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
                          if (menu == null) {
                            Database.addItem(
                                id: id.toString(),
                                menu: menuController.text,
                                bahan: bahanController.text,
                                caraBuat: caraBuatController.text);
                          } else {
                            Database.updateItem(
                            uid: id.toString(),
                            menu: menuController.text,
                            bahan: bahanController.text,
                            caraBuat: bahanController.text,
                            docId: docId);
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context);
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
