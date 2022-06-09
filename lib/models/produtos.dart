import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  String id;
  String title;
  String type;
  String description;
  String filename;
  int height;
  int width;
  double price;
  int rating;
  int excluido;
  String created;
  String imageurlfirebase;

  Produto({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.height,
    required this.width,
    required this.price,
    required this.rating,
    required this.excluido,
    required this.created,
    required this.imageurlfirebase,
  });

  factory Produto.fromDocument(DocumentSnapshot doc) {
    return Produto(
      id: doc['id'],
      title: doc['title'],
      type: doc['type'],
      description: doc['description'],
      filename: doc['filename'],
      height: doc['height'],
      width: doc['width'],
      price: doc['price'],
      rating: doc['rating'],
      excluido: doc['excluido'],
      created: doc['created'],
      imageurlfirebase: '',
    );
  }
}
