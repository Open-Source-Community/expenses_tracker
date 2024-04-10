import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  CustomFormField({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
  });
  final String label;
  final TextEditingController? controller;
  TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 17),
      child: TextFormField(
        keyboardType: keyboardType,
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
