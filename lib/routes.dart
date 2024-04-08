import 'package:expense_tracker/view/screens/auth/settings_page.dart';
import 'package:flutter/material.dart';
import 'components/constants/routes.dart';
import 'view/screens/auth/login_screen.dart';
import 'view/screens/auth/signup_screen.dart';

import 'view/screens/home_screen.dart';
import 'view/screens/shop/shopping_list_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.signIn: (context) => const LoginScreen(),
  AppRoutes.signUp: (context) => const SignUpScreen(),
  AppRoutes.homepage: (context) => HomeScreen(),
  AppRoutes.shoppingList: (context) => ShoppingList(),
  AppRoutes.settings: (context) => SettingsPage(),
};
