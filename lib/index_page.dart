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
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bem-vindo, Cleber',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    minimumSize:
                        MaterialStateProperty.all(const Size.fromHeight(55)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 2, 2, 2),
                    )),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.CADASTRAROCORRENCIA);
                },
                child: const Text(
                  'Cadastrar ocorrencia',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // If user logado, então tem que retornar esse botão. Caso não nem mostra
              // Text(
              //     'If user logado, então tem que retornar esse botão. Caso não nem mostra'),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(55)),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xffe69012),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.LISTAOCORRENCIA);
                },
                child: const Text(
                  'Lista de ocorrencias',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
