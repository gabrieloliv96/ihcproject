import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:im_stepper/stepper.dart';

import '../models/ocorrencia_model.dart';

class OcorrenciaPage extends StatefulWidget {
  const OcorrenciaPage({super.key});

  @override
  State<OcorrenciaPage> createState() => _OcorrenciaPageState();
}

class _OcorrenciaPageState extends State<OcorrenciaPage> {
  Future _fetchOcorrencia() async {
    return await OcorrenciaModel(
        id: 1, status: 1, nome: "Teste", observacao: 'Vítima vitima');
  }

  // Future teste() async {
  //   await db.collection("usuarios").get();
  // }

  @override
  Widget build(BuildContext context) {
    int activeStep = 5; // Initial step set to 5.

    int upperBound = 6;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _fetchOcorrencia(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          OcorrenciaModel ocorrencia = snapshot.data;
          return Column(
            children: [
              IconStepper(
                icons: [
                  Icon(Icons.access_time),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                ],

                // activeStep property set to activeStep variable defined above.
                activeStep: ocorrencia.status,

                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStep = ocorrencia.status;
                  });
                },
              ),
              // header(),
              Expanded(
                child: FittedBox(
                  child: Center(
                    child: Column(
                      children: [
                        Text('${ocorrencia.nome}'),
                        Text('${ocorrencia.observacao}'),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // previousButton(),
                  // nextButton(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
