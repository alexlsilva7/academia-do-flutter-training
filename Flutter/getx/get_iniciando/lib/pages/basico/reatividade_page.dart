import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReatividadePage extends StatelessWidget {
  final _counter = 0.obs;

  ReatividadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Básico Reatividade'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() => Text('Contador: ${_counter.value}')),
          ElevatedButton(
            onPressed: () {
              _counter.value++;
            },
            child: const Text('Incrementar'),
          ),
        ],
      )),
    );
  }
}
