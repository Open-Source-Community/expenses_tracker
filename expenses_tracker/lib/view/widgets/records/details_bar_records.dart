import 'package:expenses_tracker/view/widgets/records/info_bar_records.dart';
import 'package:flutter/material.dart';

class DetailsBarRecords extends StatelessWidget {
  const DetailsBarRecords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InformationBar(title: "2024", data: "Mar"),
        Text(
          "|",
          style: TextStyle(color: Colors.grey, fontSize: 30),
        ),
        InformationBar(title: "Expenses", data: "0"),
        InformationBar(title: "Income", data: "0"),
        InformationBar(title: "Balance", data: "0"),
      ],
    );
  }
}
