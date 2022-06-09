import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/controllers/produto_controller.dart';
import 'package:flutter_challenge/repositories/remote_data/update_imagem_fire_storage_produto.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/progress.dart';

// ignore: must_be_immutable
class EditarImagemProduto extends StatefulWidget {
  final produtoSelecionado;
  EditarImagemProduto(this.produtoSelecionado) : super();

  @override
  EditarImagemProdutoState createState() => EditarImagemProdutoState();
}

class EditarImagemProdutoState extends State<EditarImagemProduto> {
  ProdutoController produtoController = ProdutoController();
  final picker = ImagePicker();
  File? _getImagemDaGaleria;
  bool alterouImagem = false;

  Future acessaGaleria() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 480,
      maxHeight: 640,
    );

    setState(() {
      alterouImagem = true;
      if (pickedFile != null) {
        _getImagemDaGaleria = File(pickedFile.path);
        //dadosDoproduto.filename = _getImagemDaGaleria
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 55,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constaints) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
                  child: Text(
                    'Dados Da Imagem',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38.0,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                child: Visibility(
                                  visible: true,
                                  child: Card(
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: CircleAvatar(
                                      minRadius: 70,
                                      maxRadius: 90,
                                      backgroundColor: Colors.transparent,
                                      child: alterouImagem == false
                                          ? Image.network(
                                              widget.produtoSelecionado
                                                  .imageurlfirebase,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;

                                                return Progress();
                                              },
                                            )
                                          : Image.file(
                                              File(
                                                _getImagemDaGaleria!.path,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RawMaterialButton(
                                    onPressed: () {
                                      acessaGaleria();
                                    },
                                    elevation: 2.0,
                                    fillColor: Colors.grey[300],
                                    padding: EdgeInsets.all(13.0),
                                    shape: CircleBorder(),
                                    child: Icon(
                                      Icons.photo_library,
                                      size: 35.0,
                                      color: Colors.purple[700],
                                    ),
                                  ),
                                  new GestureDetector(
                                    onTap: () {
                                      acessaGaleria();
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            'Alterar Imagem',
                                            style: TextStyle(
                                              color: Colors.purple[700],
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () async {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => UpdateDadosFirebaseAndFirestore(
                  _getImagemDaGaleria,
                ),
              ),
              (Route<dynamic> route) => false,
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Text(
              'Continuar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
