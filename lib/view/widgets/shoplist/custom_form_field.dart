import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
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
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 17),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        autofocus: true,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
