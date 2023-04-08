import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/interfaces/button/button_prymari.dart';
import '../../domain/core/interfaces/form/form_field.dart';
import 'controllers/form_input.controller.dart';

class FormInputScreen extends GetView<FormInputController> {
  const FormInputScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormInputScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: FormPersonInfo(),
      ),
    );
  }
}

class FormPersonInfo extends GetView<FormInputController> {
  const FormPersonInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              // const WrapperImagePicker(),
              TextFieldCostum(
                controller: controller.imageC,
                titel: 'Link Image',
                isCheck: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldCostum(
                controller: controller.nameC,
                titel: 'Nama Makanan',
                isCheck: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldCostum(
                controller: controller.priceC,
                titel: 'Harga',
                isCheck: true,
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldCostum(
                controller: controller.kodeC,
                titel: 'Kode Makanan',
                isCheck: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => ButtonPrimary.isLoading(
                  titel: 'Simpan',
                  onPressed: controller.postData,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
