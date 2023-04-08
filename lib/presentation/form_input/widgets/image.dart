import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/image.controller.dart';
import '../state/image_state.dart';

class WrapperImagePicker extends GetView<ImagesController> with ImageState {
  const WrapperImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => imageSuccess(
        state!,
        (index) => controller.removeImage(index),
      ),
      onEmpty: imageEmpty(controller.getImage),
    );
  }
}
