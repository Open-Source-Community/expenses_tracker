import 'package:expense_tracker/core/model/expenses_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/routes.dart';
import '../../../core/model/UserModel.dart';
import '../../../core/model/incomes_model.dart';
import '../../../core/model/list_model.dart';
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
                label: const Text("Username"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                icon: const Icon(Icons.person),
                filled: true,
                fillColor: const Color.fromARGB(255, 43, 43, 43)),
            controller: userValue,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                label: const Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: const Color.fromARGB(255, 43, 43, 43),
                filled: true),
            controller: passValue,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                label: const Text("Confirm Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: const Color.fromARGB(255, 43, 43, 43),
                filled: true),
            controller: confirmValue,
          ),
          const SizedBox(
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
                  ExpensesModel.user = username;
                  IncomeModel.user = username;
                  ListModel.user = user.username;
                  int? response = await db.insertUser(user);
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.signIn);
                } else if (password.compareTo(confirm) != 0) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text("Error",
                                style: TextStyle(color: Colors.yellow)),
                            content: const Text(
                              "Not the same password!",
                              style: TextStyle(fontSize: 20),
                            ),
                            icon: const Icon(Icons.error, color: Colors.red),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"))
                            ],
                          ));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              "Error",
                              style: TextStyle(color: Colors.yellow),
                            ),
                            content: const Text("Empty TextFields!",
                                style: TextStyle(fontSize: 20)),
                            icon: const Icon(Icons.error, color: Colors.red),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"))
                            ],
                          ));
                }
              },
              child: const Text("Submit")),
        ],
      ),
    );
  }
}
