import 'package:expense_tracker/view/screens/records.dart';
import 'package:flutter/material.dart';

import '../categories_list.dart';
import 'info_bar_reports.dart';

class DetailsBarReports extends StatelessWidget {
  const DetailsBarReports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          dateMonthController.text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InformationBarReports(title: "Expenses", data: "${expenses.total}"),
        InformationBarReports(title: "Income", data: "${incomes.total}"),
        InformationBarReports(
            title: "Balance", data: "${incomes.total - expenses.total}"),
      ],
    );
  }
}
