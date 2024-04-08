import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';
import '../../../model/onboardingmodel.dart';

class CustomTitleAuth extends StatelessWidget {
  final String text;

  const CustomTitleAuth({
    super.key,
    required this.height,
    required this.width,
    required this.text,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: text,
        style: const TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
      const TextSpan(
        text: OnBoardingModel.logo,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: ColorManager.yellow),
      )
    ]));
  }
}
