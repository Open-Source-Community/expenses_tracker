// ignore_for_file: avoid_print

import 'package:expense_tracker/model/expenses_model.dart';
import 'package:expense_tracker/model/incomes_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/constants/constants.dart';
import 'read_records_states.dart';

class ReadRecordsCubit extends Cubit<ReadRecordsCubitStates> {
  static ReadRecordsCubit get(context) => BlocProvider.of(context);
  ReadRecordsCubit() : super(ReadDataCubitInitialState());
  final Box _boxExpenses = Hive.box(Hiveconstants.expensesListBox);
  final Box _boxIncomes = Hive.box(Hiveconstants.incomesListBox);
  
 
  static List<ExpensesModel> listExpenses = [];
  static Map<String, double> mapExpenses = {};
  static List<IncomeModel> listIncomes = [];
  static Map<String, double> mapIncomes = {};
  static Map<String, double> noData = {"": 0.0};
  static double totalExpenses = 0.0;
  static double totalIncomes = 0.0;
  static int slidingRecords = 0;
  static int slidingCharts = 0;

  var dateYearController = TextEditingController();
  var dateMonthController = TextEditingController();

  void getLists() {
    emit(ReadDataCubitLoadingState());
    try {
      totalExpenses = 0.0;
      totalIncomes = 0.0;
      listExpenses.clear();
      listIncomes.clear();
      mapExpenses.clear();
      mapIncomes.clear();
  
 
      List<ExpensesModel> listToReturnExp = List.from(
              _boxExpenses.get(Hiveconstants.expensesListKey, defaultValue: []))
          .cast<ExpensesModel>();
      List<IncomeModel> listToReturnInc = List.from(
              _boxIncomes.get(Hiveconstants.incomesListKey, defaultValue: []))
          .cast<IncomeModel>();
      for (int i = 0; i < listToReturnExp.length; i++) {
        if (listToReturnExp[i].username.compareTo(ExpensesModel.user) == 0) {
          listExpenses.add(listToReturnExp[i]);

          mapExpenses.addAll({
            "${ExpensesModel.expensesCategories[listToReturnExp[i].indexIcons]["name"]}":
                listToReturnExp[i].amount
          });
          totalExpenses += listToReturnExp[i].amount;
        }
      }
      for (int i = 0; i < listToReturnInc.length; i++) {
        if (listToReturnInc[i].username.compareTo(IncomeModel.user) == 0) {
          listIncomes.add(listToReturnInc[i]);

          mapIncomes.addAll({
            "${IncomeModel.incomeCategories[listToReturnInc[i].indexIcons]["name"]}":
                listToReturnInc[i].amount
          });
          totalIncomes += listToReturnInc[i].amount;
        }
      }
      emit(ReadDataCubitSuccessState(
          listsExpenses: listExpenses, listsIncomes: listIncomes));


    } catch (e) {
      emit(ReadDataCubitFailedState(message: "Problem in get list#"));
    }
  }

  void toggleRecords() {
    if (slidingRecords == 0) {
      if (mapExpenses.isEmpty) {
        mapExpenses = noData;
      }
      emit(ReadExpensesDataCubitState());
    } else {
      if (mapIncomes.isEmpty) {
        mapIncomes = noData;
      }
      emit(ReadIncomesDataCubitState());
    }
  }

  void toggleCharts() {
    if (slidingCharts == 0) {
      if (mapExpenses.isEmpty) {
        mapExpenses = noData;
      }
      emit(ReadExpensesDataCubitState());
    } else {
      if (mapIncomes.isEmpty) {
        mapIncomes = noData;
      }
      emit(ReadIncomesDataCubitState());
    }
  }

  void setSliding() {
    slidingCharts = 0;
    slidingRecords = 0;
    emit(ReadDataCubitSuccessState(
        listsExpenses: listExpenses, listsIncomes: listIncomes));
  }

  void notDelete() {
    emit(ReadDataCubitSuccessState(
        listsExpenses: listExpenses, listsIncomes: listIncomes));
  }
}
