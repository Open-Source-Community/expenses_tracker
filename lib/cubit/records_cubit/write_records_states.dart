abstract class WriteRecordsCubitStates {}

class WriteDataCubitInitialState extends WriteRecordsCubitStates {}

class WriteDataCubitLoadingState extends WriteRecordsCubitStates {}

class WriteDataCubitSuccessState extends WriteRecordsCubitStates {}

class WriteExpensesCubitState extends WriteRecordsCubitStates {}

class WriteIncomesCubitState extends WriteRecordsCubitStates {}

class WriteDataCubitFailedState extends WriteRecordsCubitStates {
  final String message;
  WriteDataCubitFailedState({required this.message});
}
