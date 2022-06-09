import 'package:flutter/material.dart';
import 'package:flutter_challenge/controllers/produto_controller.dart';
import 'package:flutter_challenge/shared/progress.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constantes.dart';
import '../../shared/response_dialog.dart';

class AtualizaClientIdEClientSecret extends StatefulWidget {
  final dadosFind;
  AtualizaClientIdEClientSecret(this.dadosFind);
  @override
  _AtualizaClientIdEClientSecretState createState() =>
      _AtualizaClientIdEClientSecretState();
}

class _AtualizaClientIdEClientSecretState
    extends State<AtualizaClientIdEClientSecret> {
  late ReactionDisposer monitoraRespostaAPI;
  ProdutoController produtoController = ProdutoController();
  String? municipio;

  @override
  void initState() {
    super.initState();
    check().then((internet) {
      if (internet == false) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => FailureDialog(
              'Tente novamente \nSem conexão com internet ou conexão lenta.',
              Icons.signal_wifi_off,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        produtoController.loadImageFirebase(widget.dadosFind);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    monitoraRespostaAPI = reaction(
        (_) => produtoController.loadingRequestGetImageFirebase, (status) {
      print(produtoController.produtoList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(110.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Progress(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Prefeitura Municipa',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
