import 'package:flutter/material.dart';
import 'package:lets_cook/Database/database.dart';
import 'package:lets_cook/model/item.dart';

class EntryForm extends StatefulWidget {
  final Item item;
  final String id;
  final String menu;
  final String bahan;
  final String caraBuat;

  EntryForm(this.item, this.id, this.menu, this.bahan, this.caraBuat);
  @override
  EntryFormState createState() => EntryFormState(this.item, this.id, this.menu, this.bahan, this.caraBuat);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item item;
  String id;
  final String menu;
  final String bahan;
  final String caraBuat;

  EntryFormState(this.item, this.id, this.menu, this.bahan, this.caraBuat);
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
              // nama masakan
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
              // bahan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: bahanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Bahan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //cara buat  
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
                          Database.addItem(
                            menu: menuController.text,
                            bahan: bahanController.text,
                            caraBuat: caraBuatController.text,
                          );
                          if (item == null) {
                            // tambah data
                            item = Item(
                                menuController.text,
                                bahanController.text,
                                caraBuatController.text,
                                );
                          } else {
                            // ubah data
                            item.menu = menuController.text;
                            item.bahan = bahanController.text;
                            item.caraBuat = caraBuatController.text;
                            item.idUser = id;
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
