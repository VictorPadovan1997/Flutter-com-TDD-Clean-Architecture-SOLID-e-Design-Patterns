import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String mensagem;

  const Progress({Key? key, this.mensagem = 'Carregando...'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          Text(mensagem),
        ],
      ),
    );
  }
}
