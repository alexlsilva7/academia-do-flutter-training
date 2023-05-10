import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_connect/pages/home/home_controller.dart';
import 'package:get_connect/pages/home/home_page.dart';
import 'package:get_connect/repositories/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: BindingsBuilder(
            () {
              Get.lazyPut(() => UserRepository());
              Get.lazyPut(() => HomeController(userRepository: Get.find()));
            },
          ),
        ),
      ],
    );
  }
}
