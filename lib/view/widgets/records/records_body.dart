import 'package:expense_tracker/view/widgets/records/confirm_delete_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/records_cubit/read_records_cubit.dart';
import '../../../cubit/records_cubit/read_records_states.dart';
import '../../../cubit/records_cubit/write_records_cubit.dart';
import '../../../model/expenses_model.dart';
import '../../../model/incomes_model.dart';
import '../../../components/data_items.dart';
import '../shopping_list/no_list.dart';

class RecordsBody extends StatelessWidget {
  const RecordsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        if (state is ReadDataCubitSuccessState) {
          if (state.listsExpenses.isEmpty) {
            return _getEmptyListsWidget();
          } else {
            return _getListRecords(
                ExpensesModel.expensesCategories, state.listsExpenses);
          }
        } else if (state is ReadDataCubitFailedState) {
          return _getFailedWidget(state.message);
        } else if (state is ReadIncomesDataCubitState) {
          if (ReadRecordsCubit.listIncomes.isEmpty) {
            return _getEmptyListsWidget();
          } else {
            return _getListRecords(
                IncomeModel.incomeCategories, ReadRecordsCubit.listIncomes);
          }
        } else if (state is ReadExpensesDataCubitState) {
          if (ReadRecordsCubit.listExpenses.isEmpty) {
            return _getEmptyListsWidget();
          } else {
            return _getListRecords(ExpensesModel.expensesCategories,
                ReadRecordsCubit.listExpenses);
          }
        } else {
          return _getEmptyListsWidget();
        }
      },
    );
  }

  Widget _getListRecords(List icons, List listData) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            showDialog(
                context: context,
                builder: (context) =>
                    ConfirmDeleteRecord(listModel: listData[index]));
          },
          background: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DataItems(
              iconData: icons[listData[index].indexIcons]["icon"],
              title: icons[listData[index].indexIcons]["name"],
              price: listData[index].amount.toString(),
            ),
          ),
        );
      },
    );
  }
}

Widget _getEmptyListsWidget() {
  return const ExceptionWidget(
    icon: Icons.list_rounded,
    message: "No record is created",
  );
}

Widget _getFailedWidget(String message) {
  return ExceptionWidget(icon: Icons.error, message: message);
}
