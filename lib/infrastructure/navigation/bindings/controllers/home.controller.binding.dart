import 'package:get/get.dart';

import '../../../../domain/providers/food_model_provider.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(
      FoodModelProvider(),
      permanent: true,
    );
  }
}
