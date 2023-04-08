import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahmat_hidayat_mobile_app/domain/models/food_model_model.dart';

import '../../../domain/providers/food_model_provider.dart';

class FormInputController extends GetxController {
  TextEditingController imageC = TextEditingController();
  TextEditingController kodeC = TextEditingController();

  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();

  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  final getFoodModel = Get.find<FoodModelProvider>();

  FoodModel? foodModel = Get.arguments;

  void initLoading() {
    isLoading.value = !isLoading.value;
  }

  Future postData() async {
    initLoading();
    if (formKey.currentState!.validate()) {
      var data = FoodModel.add(
        foodCode: kodeC.text,
        name: nameC.text,
        price: priceC.text,
        picture: imageC.text,
      ).toJson();
      if (foodModel != null) {
        await getFoodModel.patchFoodModel(foodModel!.id!, data);
      } else {
        await getFoodModel.postFoodModel(data);
      }
      log(data.toString(), name: "ooo");
      Get.back();
    }
    deleteForm();
    initLoading();
  }

  void deleteForm() {
    imageC.clear();
    kodeC.clear();
    nameC.clear();
    priceC.clear();
  }

  @override
  void onInit() {
    if (foodModel != null) {
      kodeC.text = foodModel!.foodCode!;
      nameC.text = foodModel!.name!;
      priceC.text = foodModel!.price!;
      imageC.text = foodModel!.picture!;
    }
    super.onInit();
  }
}
