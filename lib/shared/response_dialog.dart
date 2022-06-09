import 'package:flutter/material.dart';

import '../main.dart';
import '../repositories/remote_data/produto_search_data_firebase.dart';

class FailureDialog extends StatelessWidget {
  final String title;
  final IconData icon;

  FailureDialog(
    this.title,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.indigo,
    );
    return Scaffold(
      body: AlertDialog(
        title: Visibility(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
          visible: title.isNotEmpty,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Icon(
                  icon,
                  size: 64,
                  color: Colors.red,
                ),
              ),
              // ignore: unnecessary_null_comparison
              visible: icon != null,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => ProdutoSearchDataFirebase(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Center(
                  child: Text(
                    'Tentar Novamente',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
