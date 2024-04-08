import 'package:flutter/material.dart';
import '../../../components/components.dart';
import '../../../cubit/onboarding_cubit/onboarding_cubit.dart';

import '../../../data/static.dart';
import '../../../model/onboardingmodel.dart';
import '../../screens/auth/login_screen.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  Widget build(BuildContext context) {
    OnBoardingCubit cubit = OnBoardingCubit.get(context);
    return PageView.builder(
        allowImplicitScrolling: true,
        controller: cubit.pageController,
        onPageChanged: (value) {
          cubit.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: Image.asset(
                    onBoardingList[i].image!,
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: width / 3),
                                  child: const Text(
                                    OnBoardingModel.logo,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => navigateToReplacement(
                                    context, const LoginScreen()),
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff181818),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: const Center(
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Color.fromARGB(
                                              255, 233, 231, 231)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 500),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          onBoardingList[i].title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 15),
                        child: Text(
                          onBoardingList[i].body!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xffABA4A2)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
