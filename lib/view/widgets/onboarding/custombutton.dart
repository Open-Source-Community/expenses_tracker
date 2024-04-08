import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';
import '../../../cubit/onboarding_cubit/onboarding_cubit.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({
    super.key,
    required this.width,
  });

  final double width;

  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          OnBoardingCubit.get(context).next();
        },
        textColor: Colors.white,
        color: ColorManager.yellow,
        minWidth: 300,
        height: 48,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
