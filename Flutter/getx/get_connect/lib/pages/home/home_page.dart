import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_connect/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state?.length ?? 0,
          itemBuilder: (_, index) {
            final user = state?[index];
            return Card(
              child: ListTile(
                title: Text(user?.name ?? ''),
                subtitle: Text(user?.email ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.updateUser(user!);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteUser(user!.id!);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        onError: (error) {
          return Center(
            child: Text(error!),
          );
        },
        onEmpty: const Center(
          child: Text('Nenhum usuário cadastrado'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.registerUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
