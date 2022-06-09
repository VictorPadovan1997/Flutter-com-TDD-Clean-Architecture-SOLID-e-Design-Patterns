import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_challenge/models/produtos.dart';

class Database {
  // Future<void> create(String name, String code) async {
  //   try {
  //     await firestore!.collection("countries").add({
  //       'name': name,
  //       'code': code,
  //       'timestamp': FieldValue.serverTimestamp()
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> delete(String id) async {
  //   try {
  //     await firestore!.collection("countries").doc(id).delete();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List<Produto> listProduto = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('flutterchallenge')
          .where('excluido', isEqualTo: false)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          var resul = Produto.fromDocument(doc);
          listProduto.add(resul);
        }
        return listProduto;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Future<void> update(String id, String name, String code) async {
  //   try {
  //     await firestore!
  //         .collection("countries")
  //         .doc(id)
  //         .update({'name': name, 'code': code});
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
