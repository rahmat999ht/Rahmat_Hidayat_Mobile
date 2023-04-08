import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahmat_hidayat_mobile_app/domain/models/food_model_model.dart';
import 'package:rahmat_hidayat_mobile_app/infrastructure/navigation/routes.dart';

import '../../../domain/providers/food_model_provider.dart';
import '../widgets/alert_details.dart';

class HomeController extends GetxController with StateMixin<List<FoodModel?>> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController? cDiBayar = TextEditingController();
  final cDiKembalikan = TextEditingController();

  final getFoodModel = Get.find<FoodModelProvider>();
  List<FoodModel?> listFood = [];
  final listShop = <FoodModel, int>{}.obs;

  final raggableScrollableController = DraggableScrollableController();

  final total = 0.obs;
  final charge = 0.obs;

  void addListShop(FoodModel item) {
    if (listShop[item] == null) {
      listShop.addAll({item: 1});
      log(listShop.toString(), name: "hhh");
    } else {
      listShop[item] = listShop[item]! + 1;
    }
  }

  void deleteListShop(FoodModel item) {
    if (listShop[item] == 1) {
      listShop.remove(item);
    } else {
      listShop[item] = listShop[item]! - 1;
    }
  }

  streamDataTotal() => listShop.listen(
        (value) {
          int data = 0;
          listShop.forEach((key, value) {
            data += int.parse(key.price ?? "0") * value;
          });
          total.value = data;
        },
      );

  void chargeValue(value) {
    final String dibayar = cDiBayar?.text ?? '0';
    int totalHarga = total.value;
    int diBayar = int.parse(dibayar);
    int kembali = diBayar - totalHarga;
    String diKembalikan = kembali.toString();
    cDiKembalikan.text = diKembalikan;
    value = cDiKembalikan.text;
    log(value, name: "iii");
  }

  void toStruck() {
    Get.toNamed(
      Routes.STRUCK,
      arguments: {
        'total': total.value,
        'di_bayar': cDiBayar?.text,
        'kembalian': cDiKembalikan.text,
        'listShop': listShop,
      },
    );
  }

  Future alertDetail() async {
    await Get.dialog(
      const AlertDitails(),
      barrierColor: Colors.black.withOpacity(0.8),
    );
  }

  @override
  void onInit() async {
    await getFoop();
    streamDataTotal();
    // charge();
    super.onInit();
  }

  Future listData() async {
    FoodModel? data;
    for (int i = 1; i <= 5; i += 2) {
      log(i.toString(), name: "lll");
      data = await getFoodModel.getFoodModelById(i);
      listFood.add(data);
      log("Data for : $listFood", name: "lll");
    }
    return listFood;
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
