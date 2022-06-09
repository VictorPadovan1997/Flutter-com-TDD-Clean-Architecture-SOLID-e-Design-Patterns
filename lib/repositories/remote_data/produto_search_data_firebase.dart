import 'package:flutter/material.dart';
import 'package:flutter_challenge/controllers/produto_controller.dart';
import 'package:flutter_challenge/models/produtos.dart';
import 'package:flutter_challenge/repositories/remote_data/findsearch.dart';
import 'package:flutter_challenge/repositories/remote_data/produto_search_imagem_and_save_local.dart';
import 'package:flutter_challenge/shared/constantes.dart';
import 'package:flutter_challenge/views/produtos/listview.dart';

import '../../shared/progress.dart';
import '../../shared/response_dialog.dart';

class ProdutoSearchDataFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProdutoController produtoController = ProdutoController();

    return Scaffold(
      body: FutureBuilder<List<Produto>>(
        future: produtoController.searchAllDataFirebase(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress(mensagem: 'Carregando...');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  var data = snapshot.data;

                  print(data);

                  print(dadosDoproduto);
                  //return ProdutoSearchImagem(data);
                  return ListViewProduto(snapshot.data);
                }
              }
          }
          return FailureDialog(
            'Erro na busca dos dados',
            Icons.error,
          );
        },
      ),
    );
  }
}
