import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllersHomePage extends StatelessWidget {
  const ControllersHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controllers Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Get.toNamed('/controllers/getx_controller_example');
              },
              child: const Text('GetX Controller Example'),
            ),
          ],
        ),
      ),
    );
  }
}
