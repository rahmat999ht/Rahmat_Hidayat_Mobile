import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home.controller.dart';
import 'widgets/body.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) {
          if (state!.isEmpty) {
            return Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [Text("Proses  "), CircularProgressIndicator()],
              ),
            );
          }
          return BodyData(
            listData: state,
          );
        },
        onEmpty: const Center(
          child: Text("Data Kosong"),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (e) {
          return Center(
            child: Text("Status = $e "),
          );
        },
      ),
    );
  }
}
