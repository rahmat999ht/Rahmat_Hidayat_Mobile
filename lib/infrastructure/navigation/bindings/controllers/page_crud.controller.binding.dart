import 'package:get/get.dart';

import '../../../../domain/providers/food_model_provider.dart';
import '../../../../presentation/page_crud/controllers/page_crud.controller.dart';

class PageCrudControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageCrudController>(
      () => PageCrudController(),
    );
    Get.put(
      FoodModelProvider(),
      permanent: true,
    );
  }
}
