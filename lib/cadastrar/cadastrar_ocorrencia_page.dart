import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../rotas/app_routes.dart';

class CadastrarOcorrenciaPage extends StatelessWidget {
  const CadastrarOcorrenciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar ocorrencia'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Nome do denunciante'),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Endereço'),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Nome da vítima'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Descrição do caso'),
                      border: OutlineInputBorder(),
                    ),
                    maxLines: null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const StadiumBorder()),
                          minimumSize: MaterialStateProperty.all(
                              const Size.fromHeight(55)),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 2, 2, 2),
                          )),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.INDEX);
                      },
                      child: const Text(
                        'Cadastrar ocorrencia',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
