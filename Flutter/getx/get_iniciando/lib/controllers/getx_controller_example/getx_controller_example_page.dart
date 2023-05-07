import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_iniciando/controllers/getx_controller_example/controller.dart';

class GetxControllerExamplePage extends StatefulWidget {
  const GetxControllerExamplePage({Key? key}) : super(key: key);

  @override
  State<GetxControllerExamplePage> createState() =>
      _GetxControllerExamplePageState();
}

class _GetxControllerExamplePageState extends State<GetxControllerExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GetX Controller Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(
                () => Text(
                  'Clicks: ${Get.find<Controller>().count}',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.reload<Controller>();
                    setState(() {});
                  },
                  child: const Text('Recarregar controller')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<Controller>().increment();
          },
          child: const Icon(Icons.add),
        ));
  }
}
