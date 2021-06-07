class ItemIndo {
  int _id;
  String _menu;
  String _bahan;
  String _caraBuat;

  int get id => _id;
  String get menu => this._menu;
  set menu(String value) => this._menu = value;
  String get bahan => this._bahan;
  set bahan(String value) => this._bahan = value;
  String get caraBuat => this._caraBuat;
  set caraBuat(String value) => this._caraBuat = value;

  // konstruktor versi 1
  ItemIndo(this._menu, this._bahan, this._caraBuat);

  // konstruktor versi 2: konversi dari Map ke Item
  ItemIndo.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._menu = map['menu'];
    this._bahan = map['bahan'];
    this._caraBuat = map['caraBuat'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['menu'] = menu;
    map['bahan'] = bahan;
    map['caraBuat'] = caraBuat;
    return map;
  }
}
