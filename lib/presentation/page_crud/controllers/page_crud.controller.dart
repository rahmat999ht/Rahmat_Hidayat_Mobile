import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../domain/models/food_model_model.dart';
import '../../../domain/providers/food_model_provider.dart';
import '../../../infrastructure/navigation/routes.dart';

class PageCrudController extends GetxController
    with StateMixin<List<FoodModel?>> {
  final getFoodModel = Get.find<FoodModelProvider>();

  void toShopPage() {
    Get.toNamed(Routes.HOME);
  }

  void toDetails(FoodModel data) {
    Get.toNamed(Routes.FORM_INPUT, arguments: data);
  }

  void toForm() {
    Get.toNamed(Routes.FORM_INPUT, arguments: null);
  }

  @override
  void onInit() async {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        await getFoop();
      },
    );
    super.onInit();
  }

  Future deleteFood(FoodModel data) async {
    return await Get.defaultDialog(
      title: "Peringatan",
      middleText: "Apakah Anda yakin ingin menhapus data makanan ini ?",
      onConfirm: () async {
        await getFoodModel.deleteFoodModel(data.id!);

        Get.back();
        Get.snackbar("Info", "Anda berhasil menghapus makanan ${data.name}");
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  Future getFoop() async {
    final data = getFoodModel.getFoodModel().then(
      (value) {
        if (value.status.hasError) {
          change(null, status: RxStatus.error(value.statusText));
          log("Status = ${value.statusText.toString()}", name: "kkk");
        } else {
          change(value.body, status: RxStatus.success());
          log(value.body.toString(), name: "kkk");
        }
      },
    );
    return await data;
  }
}
