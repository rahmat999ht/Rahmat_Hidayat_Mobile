import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormCustom extends StatelessWidget {
  const FormCustom({
    super.key,
    required this.title,
    required this.controller,
    this.onChanged,
    this.readOnly = false,
  });

  final String title;
  final bool readOnly;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged ?? (value) {},
        textAlign: TextAlign.end,
        // keyboardType: TextInputType.number,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          hintText: title,
          fillColor: readOnly ? Colors.grey[200] : Colors.lightGreen.shade300,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
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
