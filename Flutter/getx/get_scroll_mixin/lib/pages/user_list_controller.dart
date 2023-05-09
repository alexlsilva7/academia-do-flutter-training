import 'package:get/get.dart';
import 'package:get_scroll_mixin/models/user_model.dart';
import 'package:get_scroll_mixin/repositories/user_repository.dart';

class UserListController extends GetxController
    with StateMixin<List<UserModel>>, ScrollMixin {
  final UserRepository _userRepository;

  final _page = 0.obs;
  final _limit = 10;

  final _loading = false.obs;
  bool get loading => _loading.value;

  final workers = <Worker>[];

  UserListController(UserRepository userRepository)
      : _userRepository = userRepository;

  @override
  void onInit() {
    final worker = ever(_page, (_) {
      _findUsers();
      print('Buscando usuários: ${_page.value}');
    });
    workers.add(worker);
    super.onInit();
  }

  @override
  void onReady() {
    _findUsers();
  }

  @override
  void onClose() {
    for (var worker in workers) {
      worker.dispose();
    }
    super.onClose();
  }

  Future<void> _findUsers() async {
    _loading(true);
    try {
      final result = await _userRepository.getUsers(_page.value, _limit);

      final users = state ?? [];
      users.addAll(result);

      change(users, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error('Erro ao buscar usuários'));
    } finally {
      _loading(false);
    }
  }

  void tryAgain() {
    _findUsers();
    change(state, status: RxStatus.loading());
  }

  @override
  Future<void> onEndScroll() async {
    if (!loading) _page.value++;
  }

  @override
  Future<void> onTopScroll() async {}
}
