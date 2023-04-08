import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardActions extends StatelessWidget {
  const CardActions({
    super.key,
    this.image,
    required this.nameFood,
    required this.price,
    required this.onTapItem,
    required this.onTapDelete,
  });

  final String? image;
  final String nameFood;
  final String price;
  final void Function() onTapItem;
  final void Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    const imageProgres =
        "https://icon-library.com/images/loading-icon-png/loading-icon-png-4.jpg";

    return InkWell(
      onTap: onTapItem,
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: image ?? imageProgres,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameFood,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: 'Rp. $price ',
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
            ),
            const Spacer(),
            InkWell(
              onTap: onTapDelete,
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
