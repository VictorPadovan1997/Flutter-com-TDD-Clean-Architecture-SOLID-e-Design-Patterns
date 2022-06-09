import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/repositories/remote_data/produto_search_data_firebase.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProdutoProject());
}

class ProdutoProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: Modular.navigatorKey,
      theme: ThemeData(
        errorColor: Colors.red,
        primaryColor: Colors.indigo[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[900],
        ),
      ),
      //home: ProdutoSearchImagemAndSaveLocal(),
      home: ProdutoSearchDataFirebase(),
      //onGenerateRoute: Modular.generateRoute,
    );
  }
}
