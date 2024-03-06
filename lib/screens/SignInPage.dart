import 'package:flutter/material.dart';

import '../widgets/CustomPasswordTextField.dart';
import '../widgets/CustomTextField.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 100,
              ),
              Text(
                "Expense Tracker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                textHint: "Username",
              ),
              SizedBox(
                height: 15,
              ),
              CustomPasswordTextField(textHint: "Password"),
              SizedBox(height: 15,),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Login")),
              Row(
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text("Sign up here"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


