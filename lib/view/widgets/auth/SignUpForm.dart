import 'package:flutter/material.dart';

import '../../../core/constants/routes.dart';
import '../../../data/UserModel.dart';
import '../../../data/sqlflite.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController userValue = TextEditingController();
  TextEditingController confirmValue = TextEditingController();
  TextEditingController passValue = TextEditingController();

  @override
  void dispose() {
    userValue.dispose();
    passValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                label: Text("Username"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                icon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.black54),
            controller: userValue,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.black54,
                filled: true),
            controller: passValue,
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                label: Text("Confirm Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.black54,
                filled: true),
            controller: confirmValue,
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                String username = userValue.text.trim();
                String confirm = confirmValue.text.trim();
                String password = passValue.text.trim();
                SqlDB db = SqlDB();
                UserModel user =
                    UserModel(username: username, password: password);

                if (username.isNotEmpty &&
                    password.isNotEmpty &&
                    password.compareTo(confirm) == 0) {
                  int? response = await db.insertUser(user);
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.signIn);
                } else if (password.compareTo(confirm) != 0) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Error",
                                style: TextStyle(color: Colors.yellow)),
                            content: Text(
                              "Not the same password!",
                              style: TextStyle(fontSize: 20),
                            ),
                            icon: Icon(Icons.error, color: Colors.red),
                          ));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              "Error",
                              style: TextStyle(color: Colors.yellow),
                            ),
                            content: Text("Empty TextFields!",
                                style: TextStyle(fontSize: 20)),
                            icon: Icon(Icons.error, color: Colors.red),
                          ));
                }
              },
              child: Text("Submit")),
        ],
      ),
    );
  }
}
