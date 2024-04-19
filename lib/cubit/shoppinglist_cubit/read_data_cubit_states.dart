import '../../model/list_model.dart';

abstract class ReadDataCubitStates {}

class ReadDataCubitInitialState extends ReadDataCubitStates {}

class ReadDataCubitLoadingState extends ReadDataCubitStates {}

class ReadDataCubitSuccessState extends ReadDataCubitStates {
  final List<ListModel> Lists;
  ReadDataCubitSuccessState({required this.Lists});
}

class ReadDataCubitFailedState extends ReadDataCubitStates {
  final String message;
  ReadDataCubitFailedState({required this.message});
}
