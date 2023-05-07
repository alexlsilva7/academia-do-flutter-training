import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_iniciando/pages/atualizacao/usuario_model.dart';

class AtualizacaoObjetosPage extends StatelessWidget {
  final usuarioModel =
      UsuarioModel(id: 1, nome: 'Fulano', email: 'fulano@gmail.com').obs;

  AtualizacaoObjetosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualização Objetos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Column(
                children: [
                  Text(
                    'ID: ${usuarioModel.value.id}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Nome: ${usuarioModel.value.nome}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Email: ${usuarioModel.value.email}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                usuarioModel.value.nome = 'Ciclano';
                usuarioModel.value.email = 'ciclano@gmail.com';
                usuarioModel.refresh();
              },
              child: const Text('Alterar com refresh()'),
            ),
            TextButton(
              onPressed: () {
                usuarioModel.update((usuario) {
                  usuario!.nome = 'Beltrano';
                  usuario.email = 'beltrano@gmail.com';
                });
              },
              child: const Text('Alterar com update()'),
            ),
          ],
        ),
      ),
    );
  }
}
