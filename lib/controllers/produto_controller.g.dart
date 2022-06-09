// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoController on _ProdutoController, Store {
  late final _$produtoListAtom =
      Atom(name: '_ProdutoController.produtoList', context: context);

  @override
  List<Produto> get produtoList {
    _$produtoListAtom.reportRead();
    return super.produtoList;
  }

  @override
  set produtoList(List<Produto> value) {
    _$produtoListAtom.reportWrite(value, super.produtoList, () {
      super.produtoList = value;
    });
  }

  late final _$listNameImagesAtom =
      Atom(name: '_ProdutoController.listNameImages', context: context);

  @override
  List<String> get listNameImages {
    _$listNameImagesAtom.reportRead();
    return super.listNameImages;
  }

  @override
  set listNameImages(List<String> value) {
    _$listNameImagesAtom.reportWrite(value, super.listNameImages, () {
      super.listNameImages = value;
    });
  }

  late final _$loadingRequestGetImageFirebaseAtom = Atom(
      name: '_ProdutoController.loadingRequestGetImageFirebase',
      context: context);

  @override
  bool get loadingRequestGetImageFirebase {
    _$loadingRequestGetImageFirebaseAtom.reportRead();
    return super.loadingRequestGetImageFirebase;
  }

  @override
  set loadingRequestGetImageFirebase(bool value) {
    _$loadingRequestGetImageFirebaseAtom
        .reportWrite(value, super.loadingRequestGetImageFirebase, () {
      super.loadingRequestGetImageFirebase = value;
    });
  }

  late final _$loadImageFirebaseAsyncAction =
      AsyncAction('_ProdutoController.loadImageFirebase', context: context);

  @override
  Future loadImageFirebase(List<Produto> dadosProdutoFindFirebase) {
    return _$loadImageFirebaseAsyncAction
        .run(() => super.loadImageFirebase(dadosProdutoFindFirebase));
  }

  late final _$uploadNewImageParaOFireStoreAsyncAction = AsyncAction(
      '_ProdutoController.uploadNewImageParaOFireStore',
      context: context);

  @override
  Future<bool> uploadNewImageParaOFireStore(dynamic file, dynamic ref) {
    return _$uploadNewImageParaOFireStoreAsyncAction
        .run(() => super.uploadNewImageParaOFireStore(file, ref));
  }

  late final _$updateDadosFirebaseAsyncAction =
      AsyncAction('_ProdutoController.updateDadosFirebase', context: context);

  @override
  Future updateDadosFirebase() {
    return _$updateDadosFirebaseAsyncAction
        .run(() => super.updateDadosFirebase());
  }

  late final _$searchAllDataFirebaseAsyncAction =
      AsyncAction('_ProdutoController.searchAllDataFirebase', context: context);

  @override
  Future<List<Produto>> searchAllDataFirebase() {
    return _$searchAllDataFirebaseAsyncAction
        .run(() => super.searchAllDataFirebase());
  }

  @override
  String toString() {
    return '''
produtoList: ${produtoList},
listNameImages: ${listNameImages},
loadingRequestGetImageFirebase: ${loadingRequestGetImageFirebase}
    ''';
  }
}
