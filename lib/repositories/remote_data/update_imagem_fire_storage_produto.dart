import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/controllers/produto_controller.dart';
import 'package:flutter_challenge/repositories/remote_data/produto_search_data_firebase.dart';

import '../../main.dart';
import '../../shared/constantes.dart';
import '../../shared/progress.dart';
import '../../shared/response_dialog.dart';

ProdutoController produtoController = ProdutoController();

class UpdateDadosFirebaseAndFirestore extends StatelessWidget {
  final File? imagemPatch;
  UpdateDadosFirebaseAndFirestore(this.imagemPatch);

  @override
  Widget build(BuildContext context) {
    String referenciaParaSalvarImagemNoFirestore =
        'img-${DateTime.now().microsecond.toString()}.jpg';
    if (imagemPatch != null) {
      dadosDoproduto.filename = referenciaParaSalvarImagemNoFirestore;
    }
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: produtoController.updateDadosFirebase(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress(mensagem: 'Atualizando os Dados...');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (imagemPatch != null) {
                  return updateImagemFirebaseStore(
                    imagemPatch,
                    referenciaParaSalvarImagemNoFirestore,
                  );
                } else {
                  return ProdutoProject();
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

  updateImagemFirebaseStore(imagemPatch, reference) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: produtoController.uploadNewImageParaOFireStore(
          imagemPatch,
          reference,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress(mensagem: 'Atualizando imagem...');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ProdutoProject();
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
