
import 'package:expense_tracker/cubit/records_cubit/read_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/read_records_states.dart';
import 'package:expense_tracker/components/custom_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/records/details_bar_records.dart';
import '../widgets/records/records_body.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        ReadRecordsCubit cubit = ReadRecordsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 43, 43, 43),
       
              centerTitle: true,
              title: const Text(
                "Money Manager",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(10, 150),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const DetailsBarRecords(),
                      const SizedBox(height: 25),
                      CustomToggleSwitch(
                          index: ReadRecordsCubit.slidingRecords,
                          labels: const ['Expenses', 'Income'],
                          onToggle: (newValue) {
                            ReadRecordsCubit.slidingRecords = newValue!;
                            cubit.toggleRecords();
                          }),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            body: const RecordsBody());
      },
      listener: (context, state) {},
    );
  }
}
