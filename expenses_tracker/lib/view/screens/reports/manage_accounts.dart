import 'package:flutter/material.dart';

class ManageAccounts extends StatelessWidget {
  const ManageAccounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 21, 21, 21)),
            child: Center(
                child: Text("Manage Accounts",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
