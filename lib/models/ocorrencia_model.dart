// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OcorrenciaModel {
  int id;
  int status;
  String nome;
  String? observacao;

  OcorrenciaModel({
    required this.id,
    required this.status,
    required this.nome,
    this.observacao,
  });
}
