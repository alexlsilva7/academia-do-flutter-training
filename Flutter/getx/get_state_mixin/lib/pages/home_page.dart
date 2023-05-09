import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_state_mixin/pages/components/cep_widget.dart';
import 'package:get_state_mixin/pages/home_controller.dart';
import 'package:brasil_fields/brasil_fields.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  HomePage({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  final search = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buscar Endereço por CEP'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          controller: _textController,
                          onChanged: (value) {
                            controller.cepSearch = value.replaceAll('.', '');
                            search.value = value;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            hintText: ' Digite um CEP',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: Obx(
                              () => Visibility(
                                visible: search.value.isNotEmpty,
                                child: IconButton(
                                  onPressed: () {
                                    controller.cepSearch = '';
                                    _textController.clear();
                                    search.value = '';
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                              ),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CepInputFormatter(),
                          ],
                          onFieldSubmitted: (value) => controller.findAddress(),
                        ),
                      ),
                    ),
                    //arrow_forward
                    Container(
                      height: 56,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Colors.deepPurple,
                      ),
                      child: IconButton(
                        onPressed: () => controller.findAddress(),
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                controller.obx(
                  (state) => CepWidget(cep: state),
                  onError: (error) => Text(error.toString()),
                  onEmpty: const Text('Digite um CEP'),
                  onLoading: const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ));
  }
}
