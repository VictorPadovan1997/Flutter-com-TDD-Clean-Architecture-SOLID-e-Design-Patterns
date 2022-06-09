import 'package:flutter/material.dart';

import '../models/produtos.dart';
import '../views/produtos/editar_produto_form.dart';

modalBottomSheet(BuildContext context, Produto produtoSelecionado) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 290,
        color: Color(0xFF737373),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  produtoSelecionado.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.delete_outline,
                  ),
                  title: Text('Remover', style: TextStyle(fontSize: 20)),
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => EditarProduto(),
                    //   ),
                    // );
                  },
                ),
              ),
              Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.edit,
                  ),
                  title: Text('Editar', style: TextStyle(fontSize: 20)),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditarProduto(
                          produtoSelecionado,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(24),
            ),
          ),
        ),
      );
    },
  );
}
