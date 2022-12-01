import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastrarOcorrenciaPage extends StatelessWidget {
  const CadastrarOcorrenciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
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
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Descrição do caso'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
