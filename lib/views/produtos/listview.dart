import 'package:brasil_fields/brasil_fields.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/controllers/produto_controller.dart';
import 'package:flutter_challenge/shared/progress.dart';
import '../../shared/modal_bottom_sheet.dart';

class ListViewProduto extends StatefulWidget {
  final listProduto;
  ListViewProduto(
    this.listProduto,
  );
  @override
  _ListViewProdutoState createState() => _ListViewProdutoState();
}

class _ListViewProdutoState extends State<ListViewProduto> {
  ProdutoController produtoController = ProdutoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Produtos',
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listProduto.length,
                itemBuilder: (context, index) {
                  var resul = (FirebaseStorage.instance
                      .ref('images/' + widget.listProduto[index].filename)
                      .getDownloadURL());

                  return GestureDetector(
                    onTap: () {
                      modalBottomSheet(context, widget.listProduto[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          trailing: GestureDetector(
                            onTap: () {
                              modalBottomSheet(
                                context,
                                widget.listProduto[index],
                              );
                            },
                            child: Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.blue,
                                  size: 35,
                                ),
                              ],
                            ),
                          ),
                          leading: Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              child: Image.network(
                                widget.listProduto[index].imageurlfirebase,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;

                                  return Progress();
                                },
                              ),
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _styeText(
                                  widget.listProduto[index].title,
                                  '',
                                ),
                                _styeText(
                                  widget.listProduto[index].type,
                                  'Type: ',
                                ),
                                _styeText(
                                  UtilBrasilFields.obterReal(
                                    widget.listProduto[index].price,
                                  ),
                                  '',
                                ),
                                _styeText(
                                  widget.listProduto[index].created,
                                  'created: ',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<List<Produto>> newMethod(List<Produto> listProduto) async {
  //   listProduto.forEach((produto) async {
  //     var resul = (await FirebaseStorage.instance
  //         .ref('images/' + produto.filename)
  //         .getDownloadURL()
  //         .then((value) {
  //       produto.imageurlfirebase = value;
  //       listProdutoTratados.add(produto);
  //     }));
  //   });

  //   return listProdutoTratados;
  // }

  Text _styeText(type, title) {
    return Text(
      title + '' + type,
      style: TextStyle(
        color: Color(0xff595757),
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }
}
