import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:im_stepper/stepper.dart';

import '../models/ocorrencia_model.dart';

class OcorrenciaPage extends StatefulWidget {
  final OcorrenciaModel ocorrencia;
  const OcorrenciaPage({super.key, required this.ocorrencia});

  @override
  State<OcorrenciaPage> createState() => _OcorrenciaPageState();
}

class _OcorrenciaPageState extends State<OcorrenciaPage> {
  // Future teste() async {
  //   await db.collection("usuarios").get();
  // }

  @override
  Widget build(BuildContext context) {
    int activeStep = 5; // Initial step set to 5.

    int upperBound = 6;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ocorrencia.nome),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          IconStepper(
            icons: const [
              Icon(Icons.access_time),
              Icon(Icons.local_police_rounded),
              Icon(Icons.elderly_woman_rounded),
            ],

            // activeStep property set to activeStep variable defined above.
            activeStep: widget.ocorrencia.status,

            // This ensures step-tapping updates the activeStep.
            onStepReached: (index) {
              setState(() {
                activeStep = widget.ocorrencia.status;
              });
            },
          ),
          // header(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/mapa.jpg',
                    // height: 1250,
                    // width: 150,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Detalhes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Vitima: ${widget.ocorrencia.nome}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      // Text(widget.ocorrencia.nome),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Observação: ${widget.ocorrencia.observacao}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: null,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
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
      ),
    );
  }
}
