import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_scroll_mixin/pages/user_list_controller.dart';
import 'package:get_scroll_mixin/pages/user_list_page.dart';
import 'package:get_scroll_mixin/repositories/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Scroll Mixin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => Dio(BaseOptions(baseUrl: 'http://localhost:8080/')),
            fenix: true);
        Get.lazyPut(() => UserRepository(Get.find()), fenix: true);
      }),
      getPages: [
        GetPage(
          name: '/',
          binding: BindingsBuilder.put(() => UserListController(Get.find())),
          page: () => const UserListPage(),
        ),
      ],
    );
  }
}
