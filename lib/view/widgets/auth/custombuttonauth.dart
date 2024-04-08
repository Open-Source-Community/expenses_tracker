import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        minWidth: 300,
        onPressed: onPressed,
        textColor: Colors.white,
        color: ColorManager.yellow,
        height: 48,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
