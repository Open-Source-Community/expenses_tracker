import 'package:expense_tracker/cubit/records_cubit/read_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/read_records_states.dart';
import 'package:expense_tracker/cubit/shoppinglist_cubit/read_data_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../cubit/shoppinglist_cubit/read_data_cubit.dart';
import '../records/info_bar_records.dart';


class BarDetails extends StatelessWidget {
  const BarDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< ReadDataCubit, ReadDataCubitStates>(
      builder: (context, state) {
        ReadRecordsCubit.get(context).dateYearController.text =
            DateFormat.y().format(DateTime.now());
        ReadRecordsCubit.get(context).dateMonthController.text =
            DateFormat.MMM().format(DateTime.now());

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InformationBar(
                title: ReadRecordsCubit.get(context).dateYearController.text,
                data: ReadRecordsCubit.get(context).dateMonthController.text),
            const Text(
              "|",
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
            InformationBar(
                title: "Expenses", data: "${ReadDataCubit.total}"),
            InformationBar(
                title: "Income", data: "${ReadRecordsCubit.totalIncomes}"),
            InformationBar(
                title: "Balance",
                data:
                    "${ReadRecordsCubit.totalIncomes - ReadDataCubit.total}"),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
