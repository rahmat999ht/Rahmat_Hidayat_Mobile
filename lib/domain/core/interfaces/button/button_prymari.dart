import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.titel,
    this.width,
    this.fontSize,
  })  : isLoading = false,
        super(key: key);

  const ButtonPrimary.isLoading({
    Key? key,
    required this.onPressed,
    required this.titel,
    required this.isLoading,
    this.width,
    this.fontSize,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String titel;
  final double? width;
  final double? fontSize;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(Get.width, 48),
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                titel,
                style: TextStyle(
                  fontSize: fontSize ?? 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Geomanist',
                ),
              ),
      ),
    );
  }
}
