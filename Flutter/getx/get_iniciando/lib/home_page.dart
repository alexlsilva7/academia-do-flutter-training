import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Get.toNamed('/basico/reatividade');
              },
              child: const Text('Basico Reatividade'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/tipos/reativos');
              },
              child: const Text('Tipos Reativos'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/tipos/reativos_genericos');
              },
              child: const Text('Tipos Reativos Genéricos'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/tipos/reativos_genericos_nulos');
              },
              child: const Text('Tipos Reativos Genéricos NULOS'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/tipos/obs');
              },
              child: const Text('Tipos OBS'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/atualizacao/objetos');
              },
              child: const Text('Atualização Objetos'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/controllers');
              },
              child: const Text('Controllers'),
            ),
          ],
        ),
      ),
    );
  }
}
