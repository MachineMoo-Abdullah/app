import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    required this.label,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.controller,
    this.validator, // Add the validator parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      validator: validator, // Add the validator to the TextFormField
    );
  }
}
