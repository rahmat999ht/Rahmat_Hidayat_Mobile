import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/struck.controller.dart';

class StruckScreen extends GetView<StruckController> {
  const StruckScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Struk Pembayaran'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Struck Pembayaran',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            ...controller.listShop.keys.map(
              (e) {
                final lenghtItem = controller.listShop[e]!;
                final int totalPerItem = int.parse(e.price!) * lenghtItem;
                if (controller.listShop.isEmpty) {
                  return const Center(
                    child: Text("PickUp masih kosong"),
                  );
                }
                return data(
                  title: '${e.name} ${lenghtItem}x',
                  price: ': Rp. $totalPerItem',
                );
              },
            ),
            data(
              title: 'Total Harga',
              price: ': Rp. ${controller.total}',
            ),
            data(
              title: 'Di Bayar',
              price: ': Rp. ${controller.diBayar}',
            ),
            data(
              title: 'Kembalian',
              price: ': Rp. ${controller.kembalian}',
            ),
          ],
        ),
      ),
    );
  }

  Widget data({String? title, String? price}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
            ),
          ),
          Text(
            price!,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}
