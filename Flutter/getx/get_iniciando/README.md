# get_iniciando

Repositório para estudo do framework [Getx](https://pub.dev/packages/get) para gerenciamento de estado e rotas.

## Getx

O Getx é um framework para gerenciamento de estado e rotas, que tem como objetivo ser simples, performático e fácil de usar.

### Instalação

Para instalar o Getx, basta adicionar a dependência no arquivo pubspec.yaml:

```yaml
dependencies:
  get: ^4.1.4
```

Adicionar GetMaterialApp no lugar de MaterialApp:

```dart
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}
```

### Gerenciamento de rotas

#### Navegação simples entre telas

Para gerenciar as rotas, basta utilizar o método <b>Get.to()</b> passando o widget que será exibido:

```dart
Get.to(Home());
```

#### Rotas nomeadas

Definir as rotas nomeadas no método <b>GetMaterialApp</b>:

```dart
GetMaterialApp(
  initialRoute: '/home',
  unknownRoute: GetPage(name: '/notfound', page: () => NotFound()),
  getPages: [
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/second', page: () => Second()),
  ],
);
```

Para navegar entre as rotas nomeadas, basta utilizar o método <b>Get.toNamed()</b> passando o nome da rota:

```dart
Get.toNamed('/second');
```

#### Passando parâmetros entre telas

Para passar parâmetros entre as telas, basta utilizar o parâmetro <b>arguments</b> do método <b>Get.to()</b>:

```dart
Get.to(Home(), arguments: 'Hello World');
```

Para recuperar o parâmetro na tela de destino, basta utilizar o método <b>Get.arguments</b>:

```dart
Text(Get.arguments),
```
### Gerenciamento de estado

#### Variáveis reativas

Rx é uma variável reativa, que notifica as mudanças de valor para os widgets que estão observando.

Para criar uma variável reativa, basta utilizar a classe <b>Rx</b>:

```dart
// tipos de variáveis reativas
RxString name = RxString('');
RxInt age = RxInt(0);
RxDouble height = RxDouble(0.0);
RxBool isLogged = RxBool(false);
RxList<String> list = RxList<String>([]);

// reatividade de qualquer tipo. Ex: classe Pessoa
Rx<Pessoa> pessoa = Rx<Pessoa>(Pessoa());

// reatividade nula
Rx<Pessoa?> pessoa = Rx<Pessoa?>(null);
Rx<String?> name = Rx<String?>(null);

//ou
Rxn<Pessoa> pessoa = Rxn<Pessoa>();
RxnString name = RxnString(null);

```









