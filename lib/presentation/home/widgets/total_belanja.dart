import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class TotalBelanja extends GetView<HomeController> {
  const TotalBelanja({
    super.key,
    required this.totalHarga,
    required this.onTapCharge,
  });

  final int totalHarga;
  final void Function() onTapCharge;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.blue[700],
              size: 30,
              weight: 40,
            ),
            const SizedBox(width: 10),
            Text(
              "Rp. $totalHarga",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 35),
            minimumSize: const Size(100, 35),
            backgroundColor: Colors.blue[700],
          ),
          onPressed: totalHarga == 0 ? null : onTapCharge,
          child: const Text(
            'Charge',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
