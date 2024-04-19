import 'package:expense_tracker/cubit/shoppinglist_cubit/read_data_cubit_states.dart';
import 'package:expense_tracker/model/list_model.dart';
import 'package:expense_tracker/view/widgets/shopping_list/create_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/shoppinglist_cubit/read_data_cubit.dart';
import '../../../cubit/shoppinglist_cubit/write_data_cubit.dart';

class ConfirmDeleteList extends StatelessWidget {
  const ConfirmDeleteList({super.key, required this.listModel});
  final ListModel listModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadDataCubit, ReadDataCubitStates>(
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
                          WriteDataCubit.get(context)
                              .deleteList(listModel.indexOfList);
                          ReadDataCubit.get(context).getLists();
                          Navigator.pop(context);
                        }),
                        label: "Yes"),
                    CreateButton(
                        OnTap: () {
                          ReadDataCubit.get(context).notDelete();
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
