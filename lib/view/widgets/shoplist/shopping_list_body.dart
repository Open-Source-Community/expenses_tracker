import 'package:expense_tracker/cubit/write_data_cubit/write_data_cubit.dart';
import 'package:expense_tracker/view/widgets/shoplist/list_item.dart';
import 'package:expense_tracker/view/widgets/shoplist/no_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/read_data_cubit/read_data_cubit.dart';
import '../../../cubit/read_data_cubit/read_data_cubit_states.dart';
import '../../../model/list_model.dart';
import 'loading_widget.dart';
import 'minus_from_budget.dart';

class shoppingListBody extends StatelessWidget {
  const shoppingListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataCubitStates>(
      builder: ((context, state) {
        if (state is ReadDataCubitSuccessState) {
          if (state.Lists.isEmpty) {
            return _getEmptyListsWidget();
          }
          return _getListsWidget(state.Lists);
        } else if (state is ReadDataCubitFailedState) {
          return _getFailedWidget(state.message);
        } else {
          return _getLoadingWidget();
        }
      }),
    );
  }

  Widget _getListsWidget(List<ListModel> lists) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: UniqueKey(),
                onDismissed: (DismissDirection) {
                  if (lists[index].fromBudget) {
                    showDialog(
                        context: context,
                        builder: (context) => MinusFromBudget());
                  }
                  WriteDataCubit.get(context)
                      .deleteList(lists[index].indexOfList);
                  ReadDataCubit.get(context).getLists();
                },
                background: const Icon(Icons.delete),
                child: ListItem(list: lists[index]));
          }),
    );
  }

  Widget _getEmptyListsWidget() {
    return const ExceptionWidget(
      icon: Icons.list_rounded,
      message: "No List is created",
    );
  }

  Widget _getFailedWidget(String message) {
    return ExceptionWidget(icon: Icons.error, message: message);
  }

  Widget _getLoadingWidget() {
    return const LoadimgWidget();
  }
}
