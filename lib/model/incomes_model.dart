import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'incomes_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel {
  @HiveField(0)
  double amount;
  @HiveField(1)
  int indexIcons;
  @HiveField(2)
  String username;
  @HiveField(3)
  int indexOfList;
  double total = 0.0;
  static String user = "no user";
  // Map<String, double> map = {};
  // static List incomeList = [];
  IncomeModel({
    this.indexOfList = -1,
    this.amount = 0.0,
    this.username = "no user",
    this.indexIcons = -1,
  });
  // static final notifierListener =
  //     ValueNotifier<List<IncomeModel>>(HiveHelper().fetchDataIncome());
  static List incomeCategories = [
    {"name": "Salary", "icon": Icons.monetization_on_outlined},
    {"name": "Investments", "icon": Icons.inventory},
    {"name": "Part-time", "icon": Icons.timer},
    {"name": "Awards", "icon": Icons.card_giftcard},
    {"name": "Others", "icon": Icons.onetwothree_sharp},
  ];

  // bool add(int indexItem) {
  //   var formdata = ExpensesModel.formstate.currentState;
  //   if (formdata!.validate()) {
  //     print("Valid");
  //     var incomeModel = IncomeModel(
  //         username: user,
  //         indexIcons: indexItem,
  //         amount: double.parse(ExpensesModel.amountController.text));
  //     HiveHelper().insertToDatabaseI(incomeModel);
  //     notifierListener.value = HiveHelper().fetchDataIncome();
  //     print(notifierListener.value.length);

  //     incomeList.clear();
  //     for (var element in notifierListener.value) {
  //       if (element.username.compareTo(user) == 0) {
  //         incomeList.add(element);
  //       }
  //     }

  //     total = 0.0;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Map<String, double> convertToMap() {
  //   Map<String, double> nodata = {"": 0.0, "-": 0.0};
  //   notifierListener.value.forEach((element) {
  //     if (element.username?.compareTo(user) == 0) {
  //       map.addAll({
  //         "${incomeCategories[element.indexIcons]["name"]}": element.amount
  //       });
  //     }
  //   });
  //   if (notifierListener.value.isEmpty) {
  //     return nodata;
  //   }
  //   return map;
  // }

  // double calcTotal() {
  //   total = 0.0;
  //   for (var element in notifierListener.value) {
  //     if (element.username.compareTo(user) == 0) {
  //       total += element.amount;
  //     }
  //   }
  //   return total;
  // }

  IncomeModel decrementIndexAtDatabase() {
    return IncomeModel(
      username: user,
      amount: amount,
      indexOfList: indexOfList - 1,
      indexIcons: indexIcons - 1,
    );
  }
}
