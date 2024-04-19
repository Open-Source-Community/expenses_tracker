import 'package:expense_tracker/cubit/records_cubit/read_records_states.dart';
import 'package:expense_tracker/view/widgets/shopping_list/create_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/records_cubit/read_records_cubit.dart';
import '../../../cubit/records_cubit/write_records_cubit.dart';
import '../../../cubit/shoppinglist_cubit/read_data_cubit.dart';


class ConfirmDeleteRecord extends StatelessWidget {
  const ConfirmDeleteRecord({super.key, required this.listModel});
  final dynamic listModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Are you sure you want to delete this item?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CreateButton(
                        OnTap: (() {
                             if (ReadRecordsCubit.slidingRecords == 0) {
              WriteRecordsCubit.get(context)
                  .deleteExpenses(listModel.indexOfList);
            } else if (ReadRecordsCubit.slidingRecords == 1) {
              WriteRecordsCubit.get(context)
                  .deleteIncomes(listModel.indexOfList);
            }

            ReadRecordsCubit.get(context).getLists();
                          Navigator.pop(context);
                        }),
                        label: "Yes"),
                    CreateButton(
                        OnTap: () {
                          ReadRecordsCubit.get(context).notDelete();
                          Navigator.pop(context);
                        },
                        label: "No"),
                  ],
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
