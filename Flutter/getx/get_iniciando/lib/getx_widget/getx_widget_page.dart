import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_iniciando/getx_widget/getx_widget_controller.dart';

class GetxWidgetPage extends StatelessWidget {
  const GetxWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Widget'),
      ),
      body: Center(
        child: GetX<GetxWidgetController>(
          init: GetxWidgetController(),
          builder: (_) {
            return Column(
              children: [
                Text(
                  _.nome,
                  style: const TextStyle(fontSize: 30),
                ),
                ElevatedButton(
                  onPressed: () {
                    _.alterarNome('Getx Widget');
                  },
                  child: const Text('Alterar nome'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
