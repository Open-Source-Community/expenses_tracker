import 'package:expense_tracker/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/screens/charts_screen.dart';
import '../../view/screens/profile_screen.dart';
import '../../view/screens/records_screen.dart';
import '../../view/screens/reports_screen.dart';

class NavBarCubit extends Cubit<NavbarState> {
  NavBarCubit() : super(NavbarInitialState());
  static NavBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final List<Widget> screens = [
    RecordsPage(),
    ChartsPage(),
    ReportsPage(),
    const AccountPage()
  ];

  void changeSelectedIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}
