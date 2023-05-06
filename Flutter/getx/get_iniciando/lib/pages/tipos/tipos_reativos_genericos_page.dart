import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_iniciando/pages/tipos/model/aluno.dart';

class TiposReativosGenericosPage extends StatelessWidget {
  final nome = Rx<String>('Alex');
  final idade = Rx<int>(24);

  final lista = Rx<List<String>>(['Alex', 'João', 'Maria']);
  final mapa = Rx<Map<String, dynamic>>({
    'nome': 'Alex',
    'idade': 24,
    'altura': 1.75,
    'ativo': true,
    'lista': ['Alex', 'João', 'Maria'],
  });

  final aluno = Rx<Aluno>(Aluno(id: 1, nome: 'Alex', email: 'aluno@gmail.com'));

  TiposReativosGenericosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos reativos Genéricos'),
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
          Obx(
            () => Column(
              children: [
                Text(
                  'Lista:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ...lista.value.map(Text.new).toList(),
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
                ...mapa.value.entries
                    .map((e) => Text('${e.key}: ${e.value}'))
                    .toList(),
              ],
            ),
          ),
          Obx(
            () => Column(
              children: [
                Text(
                  'Aluno:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('Id: ${aluno.value.id}'),
                Text('Nome: ${aluno.value.nome}'),
                Text('Email: ${aluno.value.email}'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              nome.value = 'João';
              idade.value = 30;

              lista.value = ['João', 'Maria', 'Alex'];
              lista.refresh();
              mapa.value['nome'] = 'João';
              mapa.value['idade'] = 30;
              mapa.value['altura'] = 1.80;
              mapa.value['ativo'] = false;
              mapa.value['lista'] = ['João', 'Maria', 'Alex'];
              mapa.refresh();
            },
            child: const Text('Alterar valores'),
          ),
          TextButton(
            onPressed: () {
              // aluno.value.id = 2;
              // aluno.value.nome = 'João';
              // aluno.value.email = 'test@gmail.com';
              // aluno.refresh();

              //callable class
              aluno(Aluno(id: 2, nome: 'João', email: 'test@gmail.com'));
            },
            child: const Text('Alterar aluno'),
          ),
        ],
      )),
    );
  }
}
