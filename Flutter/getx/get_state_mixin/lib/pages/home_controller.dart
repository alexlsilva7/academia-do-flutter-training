import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/repository/via_cep_repository.dart';

class HomeController extends GetxController with StateMixin<CepModel> {
  final ViaCepRepository _repository;

  final _cepSearch = ''.obs;

  set cepSearch(String cepSearch) {
    _cepSearch.value = cepSearch;
    if (cepSearch.isEmpty) {
      change(null, status: RxStatus.empty());
    }
  }

  HomeController(this._repository);

  @override
  onReady() {
    super.onReady();
    change(null, status: RxStatus.empty());
  }

  Future<void> findAddress() async {
    try {
      change(state, status: RxStatus.loading());
      await 2.seconds.delay();
      final cepResult = await _repository.getCep(_cepSearch.value);
      change(cepResult, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error('Erro ao buscar CEP'));
    }
  }
}
