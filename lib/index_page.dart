import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'rotas/app_routes.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CADASTRAROCORRENCIA);
              },
              child: Text('Cadastrar ocorrencia'),
            ),
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
