// import 'package:flutter/material.dart';
// import 'package:flutter_challenge/controllers/produto_controller.dart';
// import 'package:flutter_challenge/repositories/local_data/dao/produto_dao.dart';
// import 'package:flutter_challenge/repositories/remote_data/produto_search_data_em_local.dart';
// import 'package:flutter_challenge/views/produtos/listview.dart';

// import '../../shared/progress.dart';
// import '../../shared/response_dialog.dart';

// class ProdutoSearchImagem extends StatelessWidget {
//   final dadosProdutoFindFirebase;
//   ProdutoSearchImagem(this.dadosProdutoFindFirebase);

//   @override
//   Widget build(BuildContext context) {
//     ProdutoController produtoController = ProdutoController();
//     ProdutoDAO produtoDAO = ProdutoDAO();

//     return Scaffold(
//       body: FutureBuilder<dynamic>(
//         future: produtoController.loadImageFirebase(
//           dadosProdutoFindFirebase,
//         ),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               break;
//             case ConnectionState.waiting:
//               return const Progress(
//                 mensagem: 'Buscando Imagem e salvando local',
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
