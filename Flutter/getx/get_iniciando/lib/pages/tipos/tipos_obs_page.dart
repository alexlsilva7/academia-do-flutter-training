import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiposObsPage extends StatelessWidget {
  final nome = 'Alex'.obs;
  final idade = 0.obs;
  final isAluno = false.obs;
  final peso = 0.0.obs;
  final cursos = <String>['Flutter', 'Dart', 'Getx'].obs;
  TiposObsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos OBS'),
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
                  'É aluno: ${isAluno.value}',
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            Obx(() => Text(
                  'Peso: ${peso.value}',
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            Obx(
              () => Column(
                children: [
                  Text(
                    'Cursos:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ...cursos.map(Text.new).toList(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                nome.value = 'João';
                idade.value = 24;
                isAluno.value = true;
                peso.value = 75.5;
                cursos.add('CURSO TESTE');
              },
              child: const Text('Alterar valores'),
            ),
          ],
        ),
      ),
    );
  }
}
