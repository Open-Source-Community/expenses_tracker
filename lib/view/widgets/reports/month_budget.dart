import 'package:expense_tracker/cubit/records_cubit/read_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/read_records_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/constants/constants.dart';
import 'budget_details.dart';

class MonthlyBudget extends StatelessWidget {
  const MonthlyBudget({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(color: Colors.grey.shade600, width: 0.4)),
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 26, 26, 26)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: ListTile(
                title: const Text(
                  "Monthly Budget",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.yellow),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            BudgetDetails(
                title: "Remaining:",
                data:
                    "${ReadRecordsCubit.totalIncomes - ReadRecordsCubit.totalExpenses}"),
            const Divider(
              endIndent: 85,
              indent: 85,
            ),
            BudgetDetails(
                title: "Budget:", data: "${ReadRecordsCubit.totalIncomes}"),
            BudgetDetails(
                title: "Expenses:", data: "${ReadRecordsCubit.totalExpenses}"),
          ]),
        );
      },
      listener: (context, state) {},
    );
  }
}
