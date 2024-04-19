import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textitle;
  final String textbody;
  const CustomTextBodyAuth({
    super.key,
    required this.textitle,
    required this.textbody,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          textitle,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: ColorManager.yellow),
        ),
        Text(
          textbody,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ]),
    );
  }
}
