# get_scroll_mixin

Projeto flutter para exemplificar o uso de mixin para controle do scroll de um ListView, usando o ScrollMixin do getx.

## Getting Started

Para usar o mixin, basta importar o arquivo scroll_mixin.dart e adicionar o mixin no seu controller.

```dart
import 'package:get/get.dart';


class HomeController extends GetxController with ScrollMixin {
  
    @override
    Future<void> onTopScroll() async {}

    @override
    Future<void> onEndScroll() async {}
}
```

No seu widget, basta adicionar o controller e usar o mixin.

```dart
ListView.builder(
    controller: controller.scrollController,
    itemCount: controller.items.length,
    itemBuilder: (context, index) {
        return ListTile(
            title: Text(controller.items[index]),
        );
    },
),
```

## Packages

- [GetX](https://pub.dev/packages/get)
- [Dio](https://pub.dev/packages/dio)
- [JsonRestServer](https://pub.dev/packages/json_rest_server)

## Backend

Backend usado para simular uma API REST com o pacote json_rest_server. Que retorna uma lista de 102 usuarios com paginação.

Endpoint: http://localhost:3000/users?page=1&limit=10

Para rodar o backend, basta instalar o pacote json_rest_server e rodar o comando:

```bash
json_rest_server run
```





