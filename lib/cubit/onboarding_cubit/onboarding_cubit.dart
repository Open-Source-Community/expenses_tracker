import 'package:expense_tracker/cubit/onboarding_cubit/onboarding_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/static.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  int currentPage = 0;
  PageController pageController = PageController();

  void next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      emit(OnBoardingEnding());
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
      emit(OnBoardingNextPage());
    }
  }

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnBoardingOnPageChanged());
  }
}
