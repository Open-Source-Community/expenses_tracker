import 'package:expense_tracker/data/UserModel.dart';
import 'package:expense_tracker/data/sqlflite.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userValue = TextEditingController();
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
              fillColor: Colors.black54,
            ),
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
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                String username = userValue.text.trim();
                String password = passValue.text.trim();
                SqlDB db = SqlDB();

                if (username.isNotEmpty && password.isNotEmpty) {
                  UserModel? user = await db.getUser(username);

                  if (user != null) {
                    if (user.password.compareTo(password) == 0)
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(AppRoutes.homepage);
                  }
                } else {

                }
              },
              child: const Text("Login")),
        ],
      ),
    );
  }
}
