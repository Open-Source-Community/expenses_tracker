import 'package:expense_tracker/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomPasswordTextField.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 100,
                height: 150,
              ),
              Text(
                "Create a new account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20,),
              CustomTextField(textHint: "Username"),
              SizedBox(height: 15,),
              CustomPasswordTextField(textHint: "Password"),
              SizedBox(height: 15,),
              CustomPasswordTextField(textHint: "Confirm Password",),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
