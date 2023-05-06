import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiposReativosPage extends StatelessWidget {
  final nome = RxString('Alex');
  final idade = RxInt(24);
  final altura = RxDouble(1.75);
  final ativo = RxBool(true);
  final lista = RxList<String>(['Alex', 'João', 'Maria']);
  final mapa = RxMap<String, dynamic>({
    'nome': 'Alex',
    'idade': 24,
    'altura': 1.75,
    'ativo': true,
    'lista': ['Alex', 'João', 'Maria'],
  });

  TiposReativosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos reativos'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                'Nome: ${nome.value}',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Obx(() => Text(
                'Idade: ${idade.value}',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Obx(() => Text(
                'Altura: ${altura.value}',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Obx(() => Text(
                'Ativo: ${ativo.value}',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Obx(
            () => Column(
              children: [
                Text(
                  'Lista:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ...lista.map(Text.new).toList(),
              ],
            ),
          ),
          Obx(
            () => Column(
              children: [
                Text(
                  'Mapa:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ...mapa.entries
                    .map((e) => Text('${e.key}: ${e.value}'))
                    .toList(),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              nome.value = 'João';
              idade.value = 30;
              altura.value = 1.80;
              ativo.value = false;
              lista.value = ['João', 'Maria', 'Alex'];
              mapa['nome'] = 'João';
              mapa['idade'] = 30;
              mapa['altura'] = 1.80;
              mapa['ativo'] = false;
              mapa['lista'] = ['João', 'Maria', 'Alex'];
            },
            child: const Text('Alterar valores'),
          ),
        ],
      )),
    );
  }
}
