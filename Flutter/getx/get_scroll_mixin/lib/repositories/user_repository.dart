import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_scroll_mixin/models/user_model.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(Dio dio) : _dio = dio;

  Future<List<UserModel>> getUsers(int page, int limit) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );
      return response.data!
          .map<UserModel>((user) => UserModel.fromMap(user))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar usuários', error: e, stackTrace: s);
      rethrow;
    } on Exception catch (e, s) {
      log('Erro ao buscar usuários', error: e, stackTrace: s);
      throw Exception('Erro ao buscar usuários');
    }
  }
}
