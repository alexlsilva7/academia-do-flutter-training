import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_iniciando/controllers/controllers_home_page.dart';
import 'package:get_iniciando/controllers/getx_controller_example/controller.dart';
import 'package:get_iniciando/controllers/getx_controller_example/getx_controller_example_page.dart';
import 'package:get_iniciando/getx_widget/getx_widget_page.dart';
import 'package:get_iniciando/home_page.dart';
import 'package:get_iniciando/pages/atualizacao/atualizacao_objetos_page.dart';
import 'package:get_iniciando/pages/basico/reatividade_page.dart';
import 'package:get_iniciando/pages/page_not_found_page.dart';
import 'package:get_iniciando/pages/tipos/tipos_obs_page.dart';
import 'package:get_iniciando/pages/tipos/tipos_reativos_genericos_page.dart';
import 'package:get_iniciando/pages/tipos/tipos_reativos_genericos_nulos_page.dart';
import 'package:get_iniciando/pages/tipos/tipos_reativos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: '/home',
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const PageNotFoundPage(),
      ),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/basico/reatividade', page: () => ReatividadePage()),
        GetPage(name: '/tipos/reativos', page: () => TiposReativosPage()),
        GetPage(
            name: '/tipos/reativos_genericos',
            page: () => TiposReativosGenericosPage()),
        GetPage(
            name: '/tipos/reativos_genericos_nulos',
            page: () => TiposReativosGenericosNulosPage()),
        GetPage(name: '/tipos/obs', page: () => TiposObsPage()),
        GetPage(
            name: '/atualizacao/objetos', page: () => AtualizacaoObjetosPage()),
        GetPage(
          name: '/controllers',
          page: () => const ControllersHomePage(),
          children: [
            GetPage(
              name: '/getx_controller_example',
              page: () => const GetxControllerExamplePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => Controller());
              }),
            ),
          ],
        ),
        GetPage(
          name: '/getx_widget',
          page: () => const GetxWidgetPage(),
        ),
      ],
    );
  }
}
