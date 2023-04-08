import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahmat_hidayat_mobile_app/presentation/home/controllers/home.controller.dart';

class FormSearch extends GetView<HomeController> {
  const FormSearch({Key? key, this.onChanged}) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            controller: controller.queryC,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[800]!,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey[800]!,
                ),
              ),
              suffixIcon: Obx(() => controller.isSearch.isFalse
                  ? const SizedBox()
                  : IconButton(
                      icon: const Icon(
                        Icons.close_sharp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        controller.queryC.clear();
                        controller.isSearch.value = false;
                      },
                    )),
              hintText: 'Search',
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                fontFamily: 'Geomanist',
              ),
            ),
          ),
        )
      ],
    );
  }
}
