import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_connect/models/user_model.dart';

class UserRepository {
  final restClient = GetConnect();

  UserRepository() {
    restClient.baseUrl = 'http://localhost:8080';

    restClient.httpClient.addAuthenticator<Object?>((request) async {
      const email = 'guilherme@gmail.com';
      const password = '1234';

      final result = await restClient.post('/auth', {
        'email': email,
        'password': password,
      });

      if (!result.hasError) {
        final accessToken = result.body['access_token'];
        final type = result.body['type'];
        if (accessToken != null) {
          request.headers['authorization'] = '$type $accessToken';
        }
      } else {
        log('Erro ao autenticar', error: result.statusText);
      }

      return request;
    });

    restClient.httpClient.addRequestModifier<Object?>((request) {
      request.headers['start-time'] = DateTime.now().toIso8601String();
      return request;
    });

    restClient.httpClient.addResponseModifier((request, response) {
      response.headers?['end-time'] = DateTime.now().toIso8601String();
      return response;
    });
  }

  Future<List<UserModel>> findAll() async {
    final result = await restClient.get('/users');

    if (result.hasError) {
      throw Exception(result.statusText!);
    }

    log('Start: ${result.request?.headers['start-time']}');
    log('End: ${result.headers?['end-time']}');
    log('Diff: ${result.headers?['end-time'] != null ? DateTime.parse(result.headers!['end-time']!).difference(DateTime.parse(result.request!.headers['start-time']!)).inMilliseconds : 0}');

    return result.body
        .map<UserModel>((user) => UserModel.fromMap(user))
        .toList();
  }

  Future<void> save(UserModel user) async {
    final result = await restClient.post(
      '/users',
      user.toMap(),
    );

    if (result.hasError) {
      throw Exception('Erro ao salvar usuário (${result.statusText})');
    }
  }

  Future<void> update(UserModel user) async {
    final result = await restClient.put(
      '/users/${user.id}',
      user.toMap(),
    );

    if (result.hasError) {
      throw Exception('Erro ao atualizar usuário (${result.statusText})');
    }
  }

  Future<void> delete(int id) async {
    final result = await restClient.delete('/users/$id');

    if (result.hasError) {
      throw Exception('Erro ao deletar usuário (${result.statusText})');
    }
  }
}
