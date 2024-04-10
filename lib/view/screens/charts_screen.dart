import 'package:expense_tracker/model/incomes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/records_cubit/read_records_cubit.dart';
import '../../cubit/records_cubit/read_records_states.dart';
import '../../model/expenses_model.dart';
import '../../components/data_items.dart';
import '../../components/custom_toggle_switch.dart';
import '../../components/piechart.dart';
import '../widgets/shopping_list/loading_widget.dart';
import '../widgets/shopping_list/no_list.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ReadRecordsCubit cubit = ReadRecordsCubit.get(context);
    return BlocConsumer<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 43, 43, 43),
              centerTitle: true,
              title: const Text(
                "Charts",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(10, 70),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      CustomToggleSwitch(
                          index: ReadRecordsCubit.slidingCharts,
                          labels: const ['Expenses', 'Income'],
                          onToggle: (newValue) {
                            ReadRecordsCubit.slidingCharts = newValue!;
                            cubit.toggleCharts();
                          }),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
              ),
            ),
            body: const ChartsBody());
      },
      listener: (context, state) {},
    );
  }
}

class ChartsBody extends StatelessWidget {
  const ChartsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadRecordsCubit, ReadRecordsCubitStates>(
      builder: (context, state) {
        if (state is ReadDataCubitSuccessState) {
          if (state.listsExpenses.isEmpty) {
            return _getEmptyListsWidget();
          } else {
            return _getDataCharts(
                ReadRecordsCubit.listExpenses,
                ReadRecordsCubit.mapExpenses,
                ReadRecordsCubit.totalExpenses.toString(),
                ExpensesModel.expensesCategories);
          }
        } else if (state is ReadDataCubitFailedState) {
          return _getFailedWidget(state.message);
        } else if (state is ReadIncomesDataCubitState) {
          if (ReadRecordsCubit.listIncomes.isEmpty) {
            return _getEmptyListsWidget();
          } else {
            return _getDataCharts(
                ReadRecordsCubit.listIncomes,
                ReadRecordsCubit.mapIncomes,
                ReadRecordsCubit.totalIncomes.toString(),
                IncomeModel.incomeCategories);
          }
        } else if (state is ReadExpensesDataCubitState) {
          if (ReadRecordsCubit.listExpenses.isEmpty) {
            return _getEmptyListsWidget();
          } else {
            return _getDataCharts(
                ReadRecordsCubit.listExpenses,
                ReadRecordsCubit.mapExpenses,
                ReadRecordsCubit.totalExpenses.toString(),
                ExpensesModel.expensesCategories);
          }
        } else {
          return _getEmptyListsWidget();
        }
      },
    );
  }

  SingleChildScrollView _getDataCharts(
      List listData, Map<String, double> mapData, String total, List icons) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(color: Colors.grey.shade600, width: 0.4)),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 26, 26, 26)),
              child: CustomPieChart(centerTextTotal: total, dataMap: mapData)),
          SizedBox(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DataItems(
                      iconData: icons[listData[index].indexIcons]["icon"],
                      title: icons[listData[index].indexIcons]["name"],
                      price: listData[index].amount.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getEmptyListsWidget() => const ExceptionWidget(
        icon: Icons.list_rounded,
        message: "No record is created",
      );

  Widget _getFailedWidget(String message) =>
      ExceptionWidget(icon: Icons.error, message: message);

  Widget _getLoadingWidget() => const LoadingWidget();
}
