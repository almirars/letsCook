class ItemWest {
  int _id;
  String _menuW;
  String _bahanW;
  String _caraBuatW;

  int get id => _id;
  String get menuW => this._menuW;
  set menuW(String value) => this._menuW = value;
  String get bahanW => this._bahanW;
  set bahanW(String value) => this._bahanW = value;
  String get caraBuatW => this._caraBuatW;
  set caraBuatW(String value) => this._caraBuatW = value;

  // konstruktor versi 1
  ItemWest(this._menuW, this._bahanW, this._caraBuatW);

  // konstruktor versi 2: konversi dari Map ke Item
  ItemWest.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._menuW = map['menuW'];
    this._bahanW = map['bahanW'];
    this._caraBuatW = map['caraBuatW'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['menuW'] = menuW;
    map['bahanW'] = bahanW;
    map['caraBuatW'] = caraBuatW;
    return map;
  }
}
