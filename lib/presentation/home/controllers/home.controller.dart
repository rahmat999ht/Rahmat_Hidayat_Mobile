import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahmat_hidayat_mobile_app/domain/models/food_model_model.dart';
import 'package:rahmat_hidayat_mobile_app/infrastructure/navigation/routes.dart';

import '../../../domain/providers/food_model_provider.dart';
import '../widgets/alert_details.dart';

class HomeController extends GetxController with StateMixin<List<FoodModel>> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController? cDiBayar = TextEditingController();
  final cDiKembalikan = TextEditingController();
  final heigth = 0.00.obs;

  final isSearch = false.obs;
  final queryC = TextEditingController();
  var listItems = <FoodModel>[];

  final getFoodModel = Get.find<FoodModelProvider>();

  // final listFood = <FoodModel>[].obs;
  // List<FoodModel>? listFooddata;

  final listShop = <FoodModel, int>{}.obs;

  final raggableScrollableController = DraggableScrollableController();

  final total = 0.obs;
  final charge = 0.obs;

  void addHeigth() {
    if (heigth.value == 0.00) {
      heigth.value += 300.00;
      log(heigth.string, name: "ooo");
    } else {
      heigth.value -= 300.00;
    }
  }

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
    int diBayar = int.tryParse(dibayar) ?? 0;
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

  Future showAlertDetail() async {
    await Get.dialog(
      alertDitails(),
      barrierColor: Colors.black.withOpacity(0.8),
    );
  }

  void onChange(String value) {
    value.isEmpty ? isSearch.value = false : isSearch.value = true;

    change(
      value.isEmpty
          ? listItems
          : listItems
              .where((element) => element.name!.toLowerCase().contains(
                    value.toLowerCase(),
                  ))
              .toList(),
      status: RxStatus.success(),
    );
  }

  @override
  void onInit() async {
    await getFoop();
    // await listData();
    streamDataTotal();
    super.onInit();
  }

  Future getFoop() async {
    final dataInit = getFoodModel.getFoodModel().then(
      (value) {
        if (value.status.hasError) {
          change(null, status: RxStatus.error(value.statusText));
          log("Status = ${value.statusText.toString()}", name: "kkk");
        } else {
          listItems = value.body;
          listItems.sort((a, b) => a.name!.compareTo(b.name!));
          change(listItems, status: RxStatus.success());
          log(value.body.toString(), name: "kkk");
        }
      },
    );
    return await dataInit;
  }
}
