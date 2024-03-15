import 'package:expense_tracker/view/widgets/shoplist/create_button.dart';
import 'package:flutter/material.dart';

class MinusFromBudget extends StatelessWidget {
  const MinusFromBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Do you want to minus it from Budget?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CreateButton(OnTap: (() => _yesOnTap(context)), label: "Yes"),
                CreateButton(OnTap: () => _noOnTap(context), label: "No"),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _yesOnTap(BuildContext context) {
    Navigator.pop(context);
  }

  void _noOnTap(BuildContext context) {
    Navigator.pop(context);
  }
}
