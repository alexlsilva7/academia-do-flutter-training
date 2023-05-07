import 'package:get/get.dart';

class Controller extends GetxController {
  final count = 0.obs;

  @override
  onInit() {
    super.onInit();
    print('onInit');
  }

  @override
  onReady() {
    super.onReady();
    print('onReady');
  }

  @override
  onClose() {
    super.onClose();
    print('onClose');
  }

  increment() => count.value++;
}
