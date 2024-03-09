import 'package:expense_tracker/core/model/expenses_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/local/hive_helper.dart';
part 'incomes_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final int index;
  double total = 0.0;
  Map<String, double> map = {};

  static final notesNotifier =
      ValueNotifier<List<IncomeModel>>(HiveHelper().fetchDataIncome());
  static List incomeCategories = [
    {"name": "Salary", "icon": Icons.monetization_on_outlined},
    {"name": "Investments", "icon": Icons.inventory},
    {"name": "Part-time", "icon": Icons.timer},
    {"name": "Awards", "icon": Icons.card_giftcard},
    {"name": "Others", "icon": Icons.onetwothree_sharp},
  ];

  IncomeModel({required this.amount, required this.index});
  bool add(int indexItem) {
    var formdata = ExpensesModel.formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      // list.add(IncomeModel(
      //     index: indexItem,
      //     amount: double.parse(ExpensesModel.amountController.text)));
      var incomeModel = IncomeModel(
          index: indexItem,
          amount: double.parse(ExpensesModel.amountController.text));
      HiveHelper().insertToDatabaseI(incomeModel);
      notesNotifier.value = HiveHelper().fetchDataIncome();
      print(notesNotifier.value.length);

      total = 0.0;
      return true;
    } else {
      return false;
    }
  }

  Map<String, double> convertToMap() {
    notesNotifier.value.forEach((element) {
      map.addAll(
          {"${incomeCategories[element.index]["name"]}": element.amount});
    });
    return map;
  }

  double calcTotal() {
    total = 0.0;
    for (var element in notesNotifier.value) {
      total += element.amount;
    }
    return total;
  }
}
