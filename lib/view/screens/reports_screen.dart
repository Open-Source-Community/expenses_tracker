import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/records_cubit/read_records_cubit.dart';
import '../../cubit/records_cubit/read_records_states.dart';
import '../../components/piechart.dart';
import '../widgets/reports/analytics_reports.dart';

// ignore: must_be_immutable
class ReportsPage extends StatelessWidget {
  ReportsPage({super.key});

  double remaining = 0.0;

  @override
  Widget build(BuildContext context) {
    remaining = ReadRecordsCubit.totalIncomes - ReadRecordsCubit.totalExpenses;
    return BlocConsumer<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 43, 43, 43),
              centerTitle: true,
              title: const Text(
                "Reports",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: Colors.grey.shade600, width: 0.4)),
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 26, 26, 26)),
                  child: CustomPieChart(
                    total: ReadRecordsCubit.totalIncomes,
                    centerTextTotal: "${ReadRecordsCubit.totalIncomes}",
                    dataMap: {
                      "Remaining": remaining,
                      "Expenses": ReadRecordsCubit.totalExpenses
                    },
                  ),
                ),
                const AnalyticsReports()
              ],
            ));
      },
      listener: (context, state) {},
    );
  }
}
