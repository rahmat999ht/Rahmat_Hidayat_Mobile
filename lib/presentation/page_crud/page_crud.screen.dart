import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/page_crud.controller.dart';
import 'widgets/body_crud.dart';

class PageCrudScreen extends GetView<PageCrudController> {
  const PageCrudScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Screen'),
        // centerTitle: true,
        actions: [
          InkWell(
            onTap: controller.toShopPage,
            child: const Icon(
              Icons.shopify,
              color: Colors.amber,
              size: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
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
          return BodyCrud(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.toForm,
        label: Row(
          children: const [
            Text("Tambah Data"),
            SizedBox(width: 5),
            Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}
