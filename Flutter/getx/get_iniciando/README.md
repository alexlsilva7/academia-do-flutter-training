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

#### Controllers

Controllers são classes que gerenciam o estado de uma tela ou de um widget.

Para criar um controller, basta utilizar a classe <b>GetxController</b>:

```dart
class HomeController extends GetxController {}
```

Adicionar o controller no widget que será gerenciado através dos bindings, ou seja, o controller será destruído quando o widget for destruído:

```dart
GetPage(
  name: '/home',
  page: () => Home(),
  binding: BindingsBuilder(() => Get.put(HomeController())),
),
```

#### Recarregando o controller

Quando o controller é injetado com lazyPut, podemos recarregar o controller para que ele seja reconstruído:

```dart
Get.reload<HomeController>();
setState(() {});
```

<b>Boas práticas:</b> 
- O ciclo de vida do controller pode ser diferente do ciclo de vida do widget, então não utilizar o onInit e onClose para inicializar e finalizar variáveis do flutter, como por exemplo, TextEditingControllers, GlobalKey, AnimationController, etc.
- Variáveis reativas não devem ser publicas, para alterar o valor de uma variável reativa, deve-se utilizar métodos públicos.


#### Alternativa ao Obx

O GetX disponibiliza o widget <b>GetX</b>, que é uma alternativa ao Obx, que permite definir o controller que será utilizado:


```dart
GetX<HomeController>(
  init: HomeController(),
  builder: (_) {
    return Text(_.name.value);
  },
),
```
#### Variaveis de estado local

//ValueBuilder

Para criar uma variável de estado local, basta utilizar o widget <b>ValueBuilder</b>:

```dart
ValueBuilder<bool>(
  initialValue: true,
  builder: (value, updater) {
    return TextFormField(
      obscureText: value,
      decoration: InputDecoration(
        labelText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () => updater(!value),
        ),
      ),
    );
  },
),
```
Existe também o widget <b>ObxValue</b>, que permite definir uma variavel observável local:

```dart
ObxValue<RxBool>(
  (value) => TextFormField(
    obscureText: value.value,
    decoration: InputDecoration(
      labelText: 'Senha',
      suffixIcon: IconButton(
        icon: Icon(Icons.visibility),
        onPressed: () => value.toggle(),
      ),
    ),
  ),
  true.obs,
),
```

#### Workers

Workers do getx ssão mecanismos para executar tarefas sempre que uma variável reativa for alterada.

Temos 4 tipos de workers:

- <b>ever</b>: executa uma tarefa sempre que uma variável reativa for alterada:

```dart
ever(
  name,
  (_) {
    print('ever');
  }, 
  condition: name.isNotNull, 
  cancelOnError: false,
  onError: (error) => print(error),
  );
```
- <b>once</b>: executa uma tarefa apenas uma vez quando uma variável reativa for alterada:

```dart
once<String>(
  name,
  (_) {
    print('once');
  }, 
  condition: name.isNotNull, 
  onError: (error) => print(error),
  );
```
- <b>interval</b>: executa uma tarefa, e ignora as chamadas por um determinado tempo, até que o tempo seja finalizado:

```dart
interval(
  Duration(seconds: 3),
  (_) {
    print('interval');
  }, 
  onError: (error) => print(error),
  );
```

- <b>debounce</b>: executa uma tarefa quando ele para de receber chamadas por um determinado tempo, muito utilizado para pesquisas no backend quando o usuário para de digitar:

```dart
debounce(
  name,
  (_) {
    print('debounce');
  }, 
  time: Duration(milliseconds: 800),
  onError: (error) => print(error),
  );
```

Adicionar os workers no onInit do controller:

```dart
final workers = <Worker>[];
@override
void onInit() {
  super.onInit();
  workers.addAll([
    ever(...),
    once<String>(...),
    interval(...),
    debounce(...),
  ]);
}
```

Depois de adicionar os workers no onInit do controller, é necessário remover os workers no onClose do controller:

```dart
@override
void onClose() {
  workers.forEach((worker) => worker.dispose());
  super.onClose();
}
```






