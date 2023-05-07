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

Para acessar o valor da variável reativa, basta utilizar o método <b>value</b>:

```dart
Text(name.value),
```
#### Extensions

Para facilitar o uso das variáveis reativas, o Getx disponibiliza as extensions, que permitem definir o tipo da variável reativa diretamente na declaração:

```dart
// tipos de variáveis reativas
final name = ''.obs;
final age = 0.obs;
final height = 0.0.obs;
final isLogged = false.obs;
final list = <String>[].obs;

// reatividade de qualquer tipo. Ex: classe Pessoa
final pessoa = Pessoa().obs;
```

#### Observando as mudanças de valor

Para observar as mudanças de valor de uma variável reativa, basta utilizar o widget <b>Obx</b>:

```dart
Obx(() => Text(name.value)),
```

#### Atualizando o valor da variável reativa

Para atualizar o valor de uma variável reativa pode-se utilizar:
- o método <b>value</b>:

```dart
//alterando o valor da variável reativa, que notificará os widgets que estão observando
name.value = 'Hello World';
```

- o método <b>update</b>:

```dart
//alterando o valor da variável reativa, que notificará os widgets que estão observando
name.update((value) => value = 'Hello World');
```

- atualizar atributos de classes com copyWith:

```dart
alunoModel.update((aluno) => aluno.copyWith(name: 'Felipe'));
```

- atualizar atributos de classes com refresh:

```dart
alunoModel.value.name = 'Felipe';
alunoModel.refresh();
```








