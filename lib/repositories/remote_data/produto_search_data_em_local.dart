// import 'package:flutter/material.dart';
// import 'package:flutter_challenge/repositories/local_data/dao/produto_dao.dart';
// import 'package:flutter_challenge/views/produtos/listview.dart';

// import '../../shared/progress.dart';
// import '../../shared/response_dialog.dart';

// class ProdutoSearchDataEmLocal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ProdutoDAO produtoDAO = ProdutoDAO();

//     return Scaffold(
//       body: FutureBuilder<dynamic>(
//         future: produtoDAO.findAll(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               break;
//             case ConnectionState.waiting:
//               return const Progress(
//                 mensagem: 'Finalizando...',
//               );
//             case ConnectionState.active:
//               break;
//             case ConnectionState.done:
//               if (snapshot.hasData) {
//                 print(snapshot.data);

//                 return ListViewProduto(snapshot.data);
//               }
//           }
//           return FailureDialog(
//             'Erro na busca dos dados',
//             Icons.error,
//           );
//         },
//       ),
//     );
//   }
// }
