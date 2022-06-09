import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/models/produtos.dart';
import 'package:flutter_challenge/repositories/local_data/dao/produto_dao.dart';
import 'package:flutter_challenge/shared/constantes.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mobx/mobx.dart';

import '../shared/convert_imagem_em_string.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoController with _$ProdutoController;

abstract class _ProdutoController with Store {
  @observable
  List<Produto> produtoList = [];

  @observable
  List<String> listNameImages = [];

  @observable
  bool loadingRequestGetImageFirebase = false;

  // @observable
  // String urlImageFirebase = '';

  // @action
  // Future<String> loadImageFirebase(BuildContext context, filename) async {
  //   await FirebaseStorageService.loadImage(context, filename).then((value) {
  //     urlImageFirebase = value;
  //   });

  //   return urlImageFirebase;
  // }

  @action
  loadImageFirebase(List<Produto> dadosProdutoFindFirebase) async {
    ProdutoDAO produtoDAO = ProdutoDAO();
    var result;

    dadosProdutoFindFirebase.forEach((produto) async {
      result = await FirebaseStorage.instance
          .ref('images/' + produto.filename)
          .getDownloadURL();
    });

    print(result);
    loadingRequestGetImageFirebase = true;

    return loadingRequestGetImageFirebase;
  }

  @action
  Future<bool> uploadNewImageParaOFireStore(file, ref) async {
    try {
      dadosDoproduto.filename = ref;
      String caminho = 'images/' + ref;
      await FirebaseStorage.instance.ref(caminho).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('erro no upload da image');
    }

    return true;
  }

  @action
  updateDadosFirebase() async {
    print(dadosDoproduto);
    try {
      await FirebaseFirestore.instance
          .collection('flutterchallenge')
          .doc(dadosDoproduto.id)
          .update({
        'title': dadosDoproduto.title,
        'type': dadosDoproduto.type,
        'description': dadosDoproduto.description,
        'filename': dadosDoproduto.filename,
        'price': dadosDoproduto.price,
        'rating': dadosDoproduto.rating,
        'excluido': dadosDoproduto.excluido,
      });
    } catch (e) {
      print(e);
    }

    return true;
  }

  @action
  Future<List<Produto>> searchAllDataFirebase() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('flutterchallenge')
          .where('excluido', isEqualTo: 0)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          var resul = Produto.fromDocument(doc);
          produtoList.add(resul);
        }
        return produtoList;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}

class ValidaFormulario {
  String? validaCampos(String? value) {
    var cleanSpace = value!.trim().isEmpty;
    if (cleanSpace) {
      return 'Campo Obrigatorio.';
    }
    return null;
  }
}
