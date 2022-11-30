import 'package:flutter/material.dart';

import 'cadastrar/cadastrar_ocorrencia_page.dart';
import 'index_page.dart';
import 'ocorrencias/ocorrencias_page.dart';
import 'rotas/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: IndexPage(),
      // initialRoute: '/',
      routes: {
        AppRoutes.CADASTRAROCORRENCIA: (context) =>
            const CadastrarOcorrenciaPage(),
        AppRoutes.OCORRENCIA: (context) => const OcorrenciasPage(),
      },
    );
  }
}
