import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_cook/model/item.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String userUid;
  static Future<void> addItem({
    String id,
    String menu,
    String bahan,
    String caraBuat,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('item').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "menu": menu,
      "bahan": bahan,
      "caraBuat": caraBuat,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addItemW({
    String id,
    String menu,
    String bahan,
    String caraBuat,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('western').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "menu": menu,
      "bahan": bahan,
      "caraBuat": caraBuat,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

   static Future<void> updateItem(
     {
    String uid,
    String menu,
    String bahan,
    String caraBuat,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('item').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "menu": menu,
      "bahan": bahan,
      "caraBuat": caraBuat,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItemW(
     {
    String uid,
    String menu,
    String bahan,
    String caraBuat,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('western').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "menu": menu,
      "bahan": bahan,
      "caraBuat": caraBuat,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems(
    String uid
  ) {
    CollectionReference notesItemCollection =
        _mainCollection.doc(uid).collection('item');

    return notesItemCollection.snapshots();
  }

static Stream<QuerySnapshot> readItemsW(
    String uid
  ) {
    CollectionReference notesItemCollection =
        _mainCollection.doc(uid).collection('western');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    String uid,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('item').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItemW({
    String uid,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('western').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}