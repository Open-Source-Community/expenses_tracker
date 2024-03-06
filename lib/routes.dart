import 'package:flutter/material.dart';

import 'core/constants/routes.dart';
import 'view/screens/auth/signIn_page.dart';
import 'view/screens/auth/signup_page.dart';
import 'view/screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.signIn: (context) => const SignInPage(),
  AppRoutes.signUp: (context) => const SignUpPage(),
  AppRoutes.homepage: (context) => HomePage(),
};
