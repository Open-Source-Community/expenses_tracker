import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../cubit/onboarding_cubit/onboarding_cubit.dart';
import '../../../cubit/onboarding_cubit/onboarding_states.dart';
import '../../../data/static.dart';
import '../../screens/auth/login_screen.dart';

class ControllerOnBoarding extends StatelessWidget {
  const ControllerOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Row(
          children: [
            ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                      margin: const EdgeInsets.only(left: 5),
                      duration: const Duration(milliseconds: 300),
                      height: 5,
                      width: cubit.currentPage == index ? 25 : 5,
                      decoration: BoxDecoration(
                          color: const Color(0xffABA4A2),
                          borderRadius: BorderRadius.circular(10)),
                    ))
          ],
        );
      },
      listener: (context, state) {
        if (state is OnBoardingEnding) {
          navigateToReplacement(context, const LoginScreen());
        }
      },
    );
  }
}
