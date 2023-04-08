import 'package:get/get.dart';

import '../../../domain/models/food_model_model.dart';

class StruckController extends GetxController {
  final total = Get.arguments['total'] as int;
  final diBayar = Get.arguments['di_bayar'] as String;
  final kembalian = Get.arguments['kembalian'] as String;
  final Map<FoodModel, int> listShop =
      Get.arguments['listShop'] as Map<FoodModel, int>;
}
