import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/food_model_model.dart';

class CardPickUp extends StatelessWidget {
  const CardPickUp({
    super.key,
    required this.data,
    required this.onTapPlus,
    required this.onTapMines,
    required this.count,
  }) : isCharge = false;
  const CardPickUp.isCharge({
    super.key,
    required this.data,
    required this.count,
  })  : onTapPlus = null,
        onTapMines = null,
        isCharge = true;
  final FoodModel? data;
  final void Function()? onTapPlus;
  final void Function()? onTapMines;
  final int count;
  final bool? isCharge;

  @override
  Widget build(BuildContext context) {
    const image =
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2016/04/Resep-Batagor.jpg?fit=1221%2C1334&ssl=1";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: data?.picture ?? image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.name!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Rp. ${data!.price} ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                      children: const [
                        TextSpan(
                          text: '/ porsi',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          isCharge == true
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Text("x$count"),
                  ),
                )
              : Row(
                  children: [
                    InkWell(
                      onTap: onTapMines,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Color(0xff1976d2),
                          ),
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 40,
                          child: Center(
                            child: Icon(Icons.remove_outlined),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Text("$count"),
                      ),
                    ),
                    InkWell(
                      onTap: onTapPlus,
                      child: Card(
                        color: Colors.blue[700],
                        child: const SizedBox(
                          height: 30,
                          width: 40,
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
