import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String textHint;

  const CustomPasswordTextField({
    super.key,required this.textHint
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: "$textHint",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),),
      ),
    );
  }
}