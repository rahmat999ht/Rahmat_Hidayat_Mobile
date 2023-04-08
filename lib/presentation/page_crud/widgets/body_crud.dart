import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/interfaces/cards/card_actions.dart';
import '../../../domain/models/food_model_model.dart';
import '../controllers/page_crud.controller.dart';

class BodyCrud extends GetView<PageCrudController> {
  const BodyCrud({super.key, required this.listData});
  final List<FoodModel?>? listData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...listData!
              .map((e) => CardActions(
                  image: e!.picture!,
                  nameFood: e.name!,
                  price: e.price!,
                  onTapItem: () {
                    controller.toDetails(e);
                  },
                  onTapDelete: () {
                    controller.deleteFood(e);
                    log("${e.id!}", name: "ooo");
                  }))
              .toList(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
