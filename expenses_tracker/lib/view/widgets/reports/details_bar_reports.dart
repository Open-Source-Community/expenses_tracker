import 'package:expenses_tracker/view/widgets/reports/info_bar_reports.dart';
import 'package:flutter/material.dart';

class DetailsBarReports extends StatelessWidget {
  const DetailsBarReports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Mar",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InformationBarReports(title: "Expenses", data: "0"),
        InformationBarReports(title: "Income", data: "0"),
        InformationBarReports(title: "Balance", data: "0"),
      ],
    );
  }
}
