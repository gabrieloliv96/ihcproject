import 'package:flutter/material.dart';
import 'package:ihcproject/login/login_page.dart';
import 'package:ihcproject/ocorrencias/lista_ocorrencia_page.dart';

import 'cadastrar/cadastrar_ocorrencia_page.dart';
import 'index_page.dart';
import 'ocorrencias/ocorrencia_page.dart';
import 'rotas/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      // initialRoute: '/',
      routes: {
        AppRoutes.INDEX: (context) => const IndexPage(),
        AppRoutes.CADASTRAROCORRENCIA: (context) =>
            const CadastrarOcorrenciaPage(),
        AppRoutes.OCORRENCIA: (context) => OcorrenciaPage(),
        AppRoutes.LISTAOCORRENCIA: (context) => const ListaOcorrenciaPage(),
      },
    );
  }
}
