import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_scroll_mixin/pages/user_list_controller.dart';

class UserListPage extends GetView<UserListController> {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List Page'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          controller: controller.scroll,
          itemBuilder: (ctx, index) {
            if (index == state?.length) {
              return Obx(() => Visibility(
                  visible: controller.loading,
                  child: const LinearProgressIndicator(
                    minHeight: 10,
                  )));
            }
            final user = state?[index];
            return ListTile(
              title: Text(user?.name ?? ''),
              subtitle: Text(user?.email ?? ''),
            );
          },
          itemCount: (state?.length ?? 0) + 1,
        ),
        onError: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                error ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: controller.tryAgain,
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
