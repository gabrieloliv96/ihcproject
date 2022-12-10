import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'rotas/app_routes.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Denuncia 24hrs',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo, Cleber'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CADASTRAROCORRENCIA);
              },
              child: Text('Cadastrar ocorrencia'),
            ),
            // If user logado, então tem que retornar esse botão. Caso não nem mostra
            Text(
                'If user logado, então tem que retornar esse botão. Caso não nem mostra'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.LISTAOCORRENCIA);
              },
              child: Text('Lista de ocorrencias'),
            ),
          ],
        ),
      ),
    );
  }
}
