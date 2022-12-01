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
      appBar: AppBar(),
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
            child: FittedBox(
              child: Center(
                child: Column(
                  children: [
                    Text(widget.ocorrencia.nome),
                    Text('${widget.ocorrencia.observacao}'),
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
      ),
    );
  }
}
