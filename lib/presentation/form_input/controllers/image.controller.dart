import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagesController extends GetxController with StateMixin<List<XFile>> {
  final _picker = ImagePicker();
  var imageFileList = <XFile>[];
  // Pick an image
  getImage() async {
    try {
      final List<XFile> image = await _picker.pickMultiImage();
      log("image ${image.length}");
      // if (image != null) {
      imageFileList = image;
      stateSuccess(imageFileList);
      // }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void removeImage(int index) {
    imageFileList.removeAt(index);
    stateSuccess(imageFileList);
  }

  @override
  void onInit() {
    change([], status: RxStatus.empty());
    super.onInit();
  }

  @override
  void onClose() {
    change([], status: RxStatus.empty());
    super.onClose();
  }

  void stateSuccess(List<XFile> list) {
    change(
      list,
      status: list.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }
}
