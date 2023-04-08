import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormCustom extends StatelessWidget {
  const FormCustom({
    super.key,
    required this.title,
    required this.controller,
    this.onChanged,
    this.readOnly = false,
    this.keyboardType,
  }) : isBorder = false;

  const FormCustom.border({
    super.key,
    required this.title,
    required this.controller,
    this.onChanged,
    this.readOnly = false,
    this.keyboardType,
  }) : isBorder = true;

  final String title;
  final bool readOnly;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool? isBorder;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged ?? (value) {},
        textAlign: isBorder! ? TextAlign.start : TextAlign.end,
        // keyboardType: TextInputType.number,
        keyboardType: keyboardType ?? TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          !isBorder!
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        decoration: InputDecoration(
          hintText: title,
          fillColor: isBorder!
              ? Colors.white
              : readOnly
                  ? Colors.grey[200]
                  : Colors.lightGreen.shade300,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: isBorder!
                ? BorderSide.lerp(
                    const BorderSide(width: 2),
                    const BorderSide(width: 2),
                    0.5,
                  )
                : BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
      ),
    );
  }
}
