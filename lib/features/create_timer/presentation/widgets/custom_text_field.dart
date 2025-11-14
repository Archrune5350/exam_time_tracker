import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormat;

  const CustomTextField({super.key, required this.controller, required this.label, this.hint, this.borderRadius, this.inputFormat});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: inputFormat,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12)
        )
      )
    );
  }
}