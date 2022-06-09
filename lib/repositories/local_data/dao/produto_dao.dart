import 'package:sqflite/sqflite.dart';
import '../../../models/produtos.dart';
import '../app_database.dart';

class ProdutoDAO {
  final String tableSql = 'CREATE TABLE produto('
      'id TEXT,'
      'title TEXT,'
      'type TEXT,'
      'description TEXT,'
      'filename TEXT,'
      'height INTEGER,'
      'width INTEGER,'
      'price NUMERIC,'
      'rating INTEGER,'
      'excluido INTEGER,'
      'created TEXT,'
      'imageurlfirebase TEXT)';

  static const String _tableName = 'produto';
  static const String _id = 'id';
  static const String _title = 'title';
  static const String _type = 'type';
  static const String _description = 'description';
  static const String _filename = 'filename';
  static const String _height = 'height';
  static const String _width = 'width';
  static const String _price = 'price';
  static const String _rating = 'rating';
  static const String _excluido = 'excluido';
  static const String _created = 'created';
  static const String _imageurlfirebase = 'imageurlfirebase';

  Future<List<Produto>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> findProdutosDbs =
        await db.rawQuery('SELECT * FROM $_tableName');
    List<Produto> findProdutos = toListFind(findProdutosDbs);

    return findProdutos;
  }

  List<Produto> toListFind(List<dynamic> produtoDbs) {
    final List<Produto> produtosList = [];
    for (Map<String, dynamic> produtoDb in produtoDbs) {
      final Produto modelProduto = Produto(
        id: produtoDb[_id],
        title: produtoDb[_title],
        type: produtoDb[_type],
        description: produtoDb[_description],
        filename: produtoDb[_filename],
        height: produtoDb[_height.toString()],
        width: produtoDb[_width],
        price: produtoDb[_price],
        rating: produtoDb[_rating],
        excluido: produtoDb[_excluido],
        created: produtoDb[_created],
        imageurlfirebase: produtoDb[_imageurlfirebase],
      );
      produtosList.add(modelProduto);
    }

    return produtosList;
  }

  Future<Produto> save(Produto produto) async {
    final checkProduto = await verificaSeExiste(produto.id);
    final Database db = await getDatabase();
    Map<String, dynamic> produtoMap = _toMap(produto);

    if (checkProduto.isNotEmpty) {
      await db.delete(_tableName);
    }

    db.insert(
      _tableName,
      produtoMap,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );

    return produto;
  }

  Future<List<Produto>> verificaSeExiste(String id) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> produtoDB =
        await db.rawQuery('SELECT * FROM produto WHERE id = ?', [id]);
    List<Produto> produto = toListFind(produtoDB);

    return produto;
  }

  Map<String, dynamic> _toMap(Produto produto) {
    final Map<String, dynamic> produtoMap = {};
    produtoMap[_id] = produto.id;
    produtoMap[_title] = produto.title;
    produtoMap[_type] = produto.type;
    produtoMap[_description] = produto.description;
    produtoMap[_filename] = produto.filename;
    produtoMap[_height] = produto.height;
    produtoMap[_width] = produto.width;
    produtoMap[_price] = produto.price;
    produtoMap[_rating] = produto.rating;
    produtoMap[_excluido] = produto.excluido;
    produtoMap[_created] = produto.created;
    produtoMap[_imageurlfirebase] = produto.imageurlfirebase;

    return produtoMap;
  }
}
