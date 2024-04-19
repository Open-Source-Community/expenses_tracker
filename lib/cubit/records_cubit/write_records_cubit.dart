import 'package:expense_tracker/cubit/records_cubit/read_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/write_records_states.dart';
import 'package:expense_tracker/model/expenses_model.dart';
import 'package:expense_tracker/model/incomes_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/constants/constants.dart';

class WriteRecordsCubit extends Cubit<WriteRecordsCubitStates> {
  static WriteRecordsCubit get(context) => BlocProvider.of(context);
  WriteRecordsCubit() : super(WriteDataCubitInitialState());

  final Box boxExpenses = Hive.box(Hiveconstants.expensesListBox);
  final Box boxIncomes = Hive.box(Hiveconstants.incomesListBox);
  static TextEditingController amountController = TextEditingController();
  static var dateController = TextEditingController();

  static GlobalKey<FormState> formstate = GlobalKey<FormState>();
  int indexOfList = 0;
  int indexIcon = -1;
  double amount = 0;
  static int sliding = 0;

  void updateIndexIcon(int index) {
    indexIcon = index;
    emit(WriteDataCubitInitialState());
  }

  void updateAmount(double amount) {
    this.amount = amount;
    emit(WriteDataCubitInitialState());
  }

  void updateDate(DateTime dateTime) {
    dateController.text = dateTime.toString();
    emit(WriteDataCubitInitialState());
  }

  void addExpenses() {
    emit(WriteDataCubitLoadingState());
    try {
      // ShoppingList
      List<ExpensesModel> lists = _getExpensesFromDataBase();
      lists.add(ExpensesModel(
          indexOfList: lists.length,
          amount: amount,
          indexIcons: indexIcon,
          username: ExpensesModel.user));
      boxExpenses.put(Hiveconstants.expensesListKey, lists);

      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in added list ######################"));
    }
  }

  void addIncomes() {
    emit(WriteDataCubitLoadingState());
    try {
      // ShoppingList
      List<IncomeModel> lists = _getIncomesFromDataBase();
      lists.add(IncomeModel(
          indexOfList: lists.length,
          amount: amount,
          indexIcons: indexIcon,
          username: IncomeModel.user));
      boxIncomes.put(Hiveconstants.incomesListKey, lists);

      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in added list ######################"));
    }
  }

  void deleteExpenses(int indexOfList) {
    emit(WriteDataCubitLoadingState());
    try {
      List<ExpensesModel> lists = _getExpensesFromDataBase();
      lists.removeAt(indexOfList);
      ReadRecordsCubit.listExpenses.clear();
      for (int i = indexOfList; i < lists.length; i++) {
        lists[i] = lists[i].decrementIndexAtDatabase();
        if (lists[i].username.compareTo(ExpensesModel.user) == 0) {
          ReadRecordsCubit.listExpenses.add(lists[i]);
        }
      }
      boxExpenses.put(Hiveconstants.expensesListKey, lists);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in delete eee list ######################"));
    }
  }

  void deleteIncomes(int indexOfList) {
    emit(WriteDataCubitLoadingState());
    try {
      List<IncomeModel> lists = _getIncomesFromDataBase();
      lists.removeAt(indexOfList);
      ReadRecordsCubit.listIncomes.clear();
      for (int i = indexOfList; i < lists.length; i++) {
        lists[i] = lists[i].decrementIndexAtDatabase();
        if (lists[i].username.compareTo(IncomeModel.user) == 0) {
          ReadRecordsCubit.listIncomes.add(lists[i]);
        }
      }
      boxIncomes.put(Hiveconstants.incomesListKey, lists);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in delete eee list ######################"));
    }
  }

  List<ExpensesModel> _getExpensesFromDataBase() => List.from(
          boxExpenses.get(Hiveconstants.expensesListKey, defaultValue: []))
      .cast<ExpensesModel>();
  List<IncomeModel> _getIncomesFromDataBase() =>
      List.from(boxIncomes.get(Hiveconstants.incomesListKey, defaultValue: []))
          .cast<IncomeModel>();

  void toggle() {
    if (sliding == 0) {
      emit(WriteExpensesCubitState());
    } else {
      emit(WriteIncomesCubitState());
    }
  }
}
