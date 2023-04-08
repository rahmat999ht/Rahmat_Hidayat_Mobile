import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class TapDraggableScrollableSheet extends GetView<HomeController> {
  const TapDraggableScrollableSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.addHeigth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: Get.width * 0.39,
            child: Divider(
              thickness: 2,
              color: Colors.blue[700],
            ),
          ),
          Icon(
            Icons.arrow_circle_up_sharp,
            color: Colors.blue[700],
            size: 30,
            weight: 10,
          ),
          SizedBox(
            height: 30,
            width: Get.width * 0.39,
            child: Divider(
              thickness: 2,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }
}
