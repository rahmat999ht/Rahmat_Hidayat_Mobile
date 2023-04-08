import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahmat_hidayat_mobile_app/presentation/home/controllers/home.controller.dart';

import '../../../domain/core/interfaces/cards/card_pick_up.dart';
import '../../../domain/core/interfaces/form/form.dart';
import 'details_value.dart';

class AlertDitails extends GetView<HomeController> {
  const AlertDitails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.end,
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: Get.back,
              child: const Padding(
                padding: EdgeInsets.only(top: 8, right: 8),
                child: Icon(Icons.close),
              ),
            ),
          ],
        ),
        iconColor: Colors.black38,
        iconPadding: const EdgeInsets.all(0),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.food_bank_outlined,
                color: Colors.blue[600],
              ),
              Text(
                "Detail Pesanan",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[600],
                ),
              ),
            ],
          ),
        ),
        content: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...controller.listShop.keys.map(
                (e) {
                  if (controller.listShop.isEmpty) {
                    return const Center(
                      child: Text("PickUp masih kosong"),
                    );
                  }
                  return CardPickUp.isCharge(
                    data: e,
                    count: controller.listShop[e] ?? 0,
                  );
                },
              ),
              DetailsValue(
                title: "Total",
                value: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    controller.total.string,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              DetailsValue(
                title: "Uang Dibayar",
                value: FormCustom(
                  title: 'dibayar',
                  controller: controller.cDiBayar!,
                  onChanged: (v) {
                    controller.chargeValue(v);
                    if (controller.charge.value > 0) {
                      controller.charge.value = int.parse(v);
                    }
                    controller.charge.value = 0;
                  },
                ),
              ),
              DetailsValue(
                title: "Kembalian",
                value: FormCustom(
                  title: 'kembalian',
                  controller: controller.cDiKembalikan,
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 35),
                  minimumSize: const Size(250, 35),
                  backgroundColor: Colors.blue[700],
                ),
                onPressed: controller.toStruck,
                child: const Text(
                  'Cetak Struk',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
