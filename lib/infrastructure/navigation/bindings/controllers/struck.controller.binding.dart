import 'package:get/get.dart';

import '../../../../presentation/struck/controllers/struck.controller.dart';

class StruckControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StruckController>(
      () => StruckController(),
    );
  }
}
