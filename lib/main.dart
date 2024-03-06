import 'package:expense_tracker/routes.dart';
import 'package:expense_tracker/view/screens/auth/signIn_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: SignInPage(),
    );
  }
}
