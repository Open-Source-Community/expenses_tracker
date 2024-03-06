import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textHint;

  const CustomTextField({super.key, required this.textHint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "$textHint",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      icon: Icon(Icons.person)),
    );
  }
}
