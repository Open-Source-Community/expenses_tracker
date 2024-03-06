import 'package:expense_tracker/core/constants/routes.dart';
import 'package:flutter/material.dart';
import '../../widgets/auth/CustomPasswordTextField.dart';
import '../../widgets/auth/CustomTextField.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign In",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 100,
              ),
              const Text(
                "Expense Tracker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextField(
                textHint: "Username",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomPasswordTextField(textHint: "Password"),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(AppRoutes.homepage);
                  },
                  child: const Text("Login")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(AppRoutes.signUp);
                      },
                      child: const Text("Sign up here"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
