import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_connect/models/user_model.dart';
import 'package:get_connect/repositories/user_repository.dart';

class HomeController extends GetxController with StateMixin<List<UserModel>> {
  final UserRepository _userRepository;

  HomeController({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  void onReady() {
    _findAll();
    super.onReady();
  }

  void _findAll() async {
    try {
      change([], status: RxStatus.loading());
      final users = await _userRepository.findAll();
      if (users.isEmpty) {
        change(users, status: RxStatus.empty());
      } else {
        change(users, status: RxStatus.success());
      }
    } on Exception catch (e, s) {
      log('Erro ao buscar usuários', error: e, stackTrace: s);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }

  void registerUser() async {
    final user = UserModel(
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123456',
    );

    await _userRepository.save(user);

    _findAll();
  }

  void updateUser(UserModel user) async {
    user.name = 'Teste 2';
    user.email = 'teste2@gmail.com';

    await _userRepository.update(user);

    _findAll();
  }

  void deleteUser(int id) async {
    await _userRepository.delete(id);

    _findAll();
  }
}
