import 'package:get/get.dart';

import '../../../../presentation/form_input/controllers/form_input.controller.dart';
import '../../../../presentation/form_input/controllers/image.controller.dart';

class FormInputControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormInputController>(
      () => FormInputController(),
    );
    Get.lazyPut<ImagesController>(
      () => ImagesController(),
    );
  }
}
