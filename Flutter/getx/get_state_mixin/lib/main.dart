import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_mixin/pages/home_bindings.dart';
import 'package:get_state_mixin/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get State Mixin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBindings(),
          page: () => HomePage(),
        ),
      ],
    );
  }
}
