import 'package:expense_tracker/model/expenses_model.dart';
import 'package:expense_tracker/model/incomes_model.dart';

abstract class ReadRecordsCubitStates {}

class ReadDataCubitInitialState extends ReadRecordsCubitStates {}

class ReadDataCubitLoadingState extends ReadRecordsCubitStates {}

class ReadExpensesDataCubitState extends ReadRecordsCubitStates {}

class ReadIncomesDataCubitState extends ReadRecordsCubitStates {}

class ReadDataCubitSuccessState extends ReadRecordsCubitStates {
  final List<ExpensesModel> listsExpenses;
  final List<IncomeModel> listsIncomes;
  ReadDataCubitSuccessState(
      {required this.listsIncomes, required this.listsExpenses});
}

class ReadDataCubitFailedState extends ReadRecordsCubitStates {
  final String message;
  ReadDataCubitFailedState({required this.message});
}
