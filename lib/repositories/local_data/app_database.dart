import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/produto_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'banco_sqlite.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ProdutoDAO().tableSql);
    },
    version: 1,
  );
}
