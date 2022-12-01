import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ihcproject/ocorrencias/ocorrencia_page.dart';

import '../models/ocorrencia_model.dart';

class ListaOcorrenciaPage extends StatefulWidget {
  const ListaOcorrenciaPage({super.key});

  @override
  State<ListaOcorrenciaPage> createState() => _ListaOcorrenciaPageState();
}

class _ListaOcorrenciaPageState extends State<ListaOcorrenciaPage> {
  // Future _fetchOcorrencia() async {
  //   return await OcorrenciaModel(
  //       id: 1, status: 1, nome: "Teste", observacao: 'Vítima vitima');
  // }

  List<OcorrenciaModel> ocorrencias = [
    OcorrenciaModel(id: 0, status: 0, nome: 'Jonas'),
    OcorrenciaModel(id: 1, status: 1, nome: 'Cleber'),
    OcorrenciaModel(id: 2, status: 2, nome: 'Cleide'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) => ListView.builder(
          itemCount: ocorrencias.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(ocorrencias[index].nome),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) =>
                        OcorrenciaPage(ocorrencia: ocorrencias[index])),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
