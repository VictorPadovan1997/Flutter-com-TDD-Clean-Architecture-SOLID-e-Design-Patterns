import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/controllers/produto_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/produtos.dart';
import '../../shared/constantes.dart';
import 'editar_imagem_produto.dart';

class EditarProduto extends StatefulWidget {
  final Produto produtoSelecionado;
  EditarProduto(this.produtoSelecionado);
  @override
  _EditarProdutoState createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProduto> {
  final _formKey = GlobalKey<FormState>();
  ValidaFormulario validaFormulario = ValidaFormulario();
  int ratingUpdate = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: widget.produtoSelecionado.title,
    );
    TextEditingController typeController = TextEditingController(
      text: widget.produtoSelecionado.type,
    );

    TextEditingController priceController = TextEditingController(
      text: widget.produtoSelecionado.price.toString(),
    );

    TextEditingController descriptionController = TextEditingController(
      text: widget.produtoSelecionado.description.toString(),
    );

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
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constaints) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 20.0),
                  child: Text(
                    'Editar Produto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                        child: TextFormField(
                          validator: validaFormulario.validaCampos,
                          controller: titleController,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Titulo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                        child: TextFormField(
                          validator: validaFormulario.validaCampos,
                          controller: typeController,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Type',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RealInputFormatter(),
                          ],
                          validator: validaFormulario.validaCampos,
                          controller: priceController,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Price',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                        child: TextFormField(
                          validator: validaFormulario.validaCampos,
                          controller: descriptionController,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ratingLayout(),
                    ],
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
            if (_formKey.currentState!.validate()) {
              dadosDoproduto.title = titleController.text;
              dadosDoproduto.type = typeController.text;
              dadosDoproduto.price = double.parse(priceController.text);
              dadosDoproduto.rating =
                  ratingUpdate == 0 ? dadosDoproduto.rating : ratingUpdate;
              dadosDoproduto.description = descriptionController.text;
              dadosDoproduto.id = widget.produtoSelecionado.id;
              dadosDoproduto.filename = widget.produtoSelecionado.filename;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      EditarImagemProduto(widget.produtoSelecionado),
                ),
              );
            }
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

  ratingLayout() {
    var ratingSelecionado =
        double.parse(widget.produtoSelecionado.rating.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Rating',
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          RatingBar.builder(
            initialRating: ratingSelecionado,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 15.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                ratingUpdate = rating.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
