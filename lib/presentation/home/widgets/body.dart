import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahmat_hidayat_mobile_app/presentation/home/widgets/total_belanja.dart';

import '../../../domain/core/interfaces/cards/card_food.dart';
import '../../../domain/core/interfaces/cards/card_pick_up.dart';
import '../../../domain/models/food_model_model.dart';
import '../controllers/home.controller.dart';
import 'header_dss.dart';

class BodyData extends GetView<HomeController> {
  const BodyData({
    super.key,
    required this.listData,
  });
  final List<FoodModel?>? listData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: listData?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 0.9,
                        childAspectRatio: 0.64,
                      ),
                      itemBuilder: (context, index) {
                        final data = listData![index];
                        return CardFood(
                          image: data?.picture,
                          nameFood: data?.name ?? ' - ',
                          price: data?.price ?? " - ",
                          onTap: () {
                            controller.addListShop(data!);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ),
        _buildDraggableScrollableSheet(),
      ],
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      controller: controller.raggableScrollableController,
      initialChildSize: 0.11,
      minChildSize: 0.11,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Scrollbar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Obx(
                  () => Column(
                    children: [
                      const TapDraggableScrollableSheet(),
                      TotalBelanja(
                        totalHarga: controller.total.value,
                        onTapCharge: controller.alertDetail,
                      ),
                      const SizedBox(height: 10),
                      ...controller.listShop.keys.map((e) {
                        if (controller.listShop.isEmpty) {
                          return const Center(
                            child: Text("PickUp masih kosong"),
                          );
                        }
                        return CardPickUp(
                          data: e,
                          count: controller.listShop[e] ?? 0,
                          onTapPlus: () {
                            controller.addListShop(e);
                          },
                          onTapMines: () {
                            controller.deleteListShop(e);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
