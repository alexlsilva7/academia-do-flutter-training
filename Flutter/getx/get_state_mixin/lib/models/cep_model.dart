import 'dart:convert';

class CepModel {
  String cep;
  String logradouro;
  String localidade;
  String bairro;
  String complemento;
  String uf;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.localidade,
    required this.bairro,
    required this.complemento,
    required this.uf,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'localidade': localidade,
      'bairro': bairro,
      'complemento': complemento,
      'uf': uf,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      localidade: map['localidade'] as String,
      bairro: map['bairro'] as String,
      complemento: map['complemento'] as String,
      uf: map['uf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) =>
      CepModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
