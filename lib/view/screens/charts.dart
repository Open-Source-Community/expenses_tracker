import 'package:expense_tracker/core/model/incomes_model.dart';
import 'package:expense_tracker/view/screens/records.dart';
import 'package:flutter/material.dart';

import '../../core/model/expenses_model.dart';
import '../widgets/categories_list.dart';
import '../widgets/data_items.dart';
import '../widgets/reports/custom_toggle_switch.dart';
import '../widgets/piechart.dart';

class ChartsPage extends StatefulWidget {
  ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

int sliding = 0;

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(10, 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                ),
                CustomToggleSwitch(
                    index: sliding,
                    labels: const ['Expenses', 'Income'],
                    onToggle: (newValue) {
                      setState(() {
                        sliding = newValue!;
                        if (sliding == 0) {
                          length = ExpensesModel.notesNotifier.value.length;
                        } else {
                          length = IncomeModel.notesNotifier.value.length;
                        }
                      });
                    }),
                const SizedBox(height: 25)
              ],
            ),
          ),
        ),
      ),
      body: length == 0
          ? NoData()
          : ValueListenableBuilder(
              valueListenable: sliding == 0
                  ? ExpensesModel.notesNotifier
                  : IncomeModel.notesNotifier,
              builder: (context, value, child) => SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(
                                color: Colors.grey.shade600, width: 0.4)),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 26, 26, 26)),
                        child: CustomPieChart(
                            centerTextTotal: sliding == 0
                                ? expenses.calcTotal().toString()
                                : incomes.calcTotal().toString(),
                            dataMap: sliding == 0
                                ? expenses.convertToMap()
                                : incomes.convertToMap())),
                    Container(
                      height: 500,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: sliding == 0
                            ? ExpensesModel.notesNotifier.value.length
                            : IncomeModel.notesNotifier.value.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DataItems(
                              iconData: sliding == 0
                                  ? ExpensesModel.expensesCategories[
                                      ExpensesModel.notesNotifier.value[index]
                                          .index]["icon"]
                                  : IncomeModel.incomeCategories[IncomeModel
                                      .notesNotifier
                                      .value[index]
                                      .index]["icon"],
                              title: sliding == 0
                                  ? ExpensesModel.expensesCategories[
                                      ExpensesModel.notesNotifier.value[index]
                                          .index]["name"]
                                  : IncomeModel.incomeCategories[IncomeModel
                                      .notesNotifier
                                      .value[index]
                                      .index]["name"],
                              price: sliding == 0
                                  ? ExpensesModel
                                      .notesNotifier.value[index].amount
                                      .toString()
                                  : IncomeModel
                                      .notesNotifier.value[index].amount
                                      .toString(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
