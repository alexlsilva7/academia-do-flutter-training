import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_scroll_mixin/repositories/user_repository.dart';
import 'package:get_scroll_mixin/models/user_model.dart';

void main() {
  group('UserRepository', () {
    late Dio dio;
    late UserRepository userRepository;

    setUp(() {
      dio = Dio(
        BaseOptions(
          baseUrl: 'http://localhost:8080/',
        ),
      );
      userRepository = UserRepository(dio);
    });

    test('should return a list of UserModels', () async {
      final users = await userRepository.getUsers(1, 10);
      expect(users, isA<List<UserModel>>());
    });

    test('should throw an exception when an error occurs', () async {
      dio.options.baseUrl = 'http://localhost:8999/errorUrl';

      expect(
        () async => await userRepository.getUsers(1, 10),
        throwsA(isA<DioError>()),
      );
    });
  });
}
