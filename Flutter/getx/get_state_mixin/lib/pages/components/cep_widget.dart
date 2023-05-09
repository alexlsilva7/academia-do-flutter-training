import 'package:flutter/material.dart';
import 'package:get_state_mixin/models/cep_model.dart';

class CepWidget extends StatelessWidget {
  final CepModel? cep;

  const CepWidget({super.key, this.cep});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            cep?.cep ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            cep?.logradouro ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            cep?.bairro ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            cep?.localidade ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            cep?.uf ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
