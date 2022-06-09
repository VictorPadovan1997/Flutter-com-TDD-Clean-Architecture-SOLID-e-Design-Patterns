import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/produtos.dart';

Produto dadosDoproduto = Produto(
  id: '',
  title: '',
  type: '',
  description: '',
  filename: '',
  height: 0,
  width: 0,
  price: 0.0,
  rating: 0,
  excluido: 0,
  created: '',
  imageurlfirebase: '',
);

List<Produto> listProduto = [];

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

void snackBar(context, titulo, {seconds}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(titulo),
      duration: Duration(
        seconds: seconds == null ? 8 : seconds,
      ),
    ),
  );
}
