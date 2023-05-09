import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';

class ViaCepRepository extends GetConnect {
  Future<CepModel> getCep(String cep) async {
    final response = await get('https://viacep.com.br/ws/$cep/json/');
    if (response.hasError) {
      log('Erro ao buscar CEP', error: response.statusText);
      throw Exception('Erro ao buscar CEP');
    }

    return CepModel.fromMap(response.body);
  }
}
