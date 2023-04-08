import 'package:flutter/material.dart';

class DetailsValue extends StatelessWidget {
  const DetailsValue({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
              child: Text(
                ":",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  value,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
