import 'package:expense_tracker/cubit/records_cubit/read_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/read_records_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'info_bar_reports.dart';

class DetailsBarReports extends StatelessWidget {
  const DetailsBarReports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        ReadRecordsCubit.get(context).dateMonthController.text =
            DateFormat.MMM().format(DateTime.now());
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              ReadRecordsCubit.get(context).dateMonthController.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InformationBarReports(
                title: "Expenses", data: "${ReadRecordsCubit.totalExpenses}"),
            InformationBarReports(
                title: "Income", data: "${ReadRecordsCubit.totalIncomes}"),
            InformationBarReports(
                title: "Balance",
                data:
                    "${ReadRecordsCubit.totalIncomes - ReadRecordsCubit.totalExpenses}"),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
