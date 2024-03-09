import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
                icon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.black54),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
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
          ),
          SizedBox(
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
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Submit")),
        ],
      ),
    );
  }
}
