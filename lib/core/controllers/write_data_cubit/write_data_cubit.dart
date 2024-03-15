import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../model/list_model.dart';
import '../read_data_cubit/read_data_cubit.dart';
import 'write_data_cubit_states.dart';

class writeDataCubit extends Cubit<WriteDataCubitStates> {
  static writeDataCubit get(context) => BlocProvider.of(context);
  writeDataCubit() : super(WriteDataCubitInitialState());

  final Box box = Hive.box(Hiveconstants.ShoppingListBox);
  String listName = "";
  bool fromBudget = false;
  int indexIcon = 0;
  int indexOfList = 0;
  double price = 0.0;

  void UpdateListName(String listName) {
    this.listName = listName;
  }

  void UpdateIndexIcon(int index) {
    this.indexIcon = index;
    emit(WriteDataCubitInitialState());
  }

  void UpdatePrice(double price) {
    this.price = price;
    emit(WriteDataCubitInitialState());
  }

  void UpdatefromBudget(bool check) {
    this.fromBudget = check;
    emit(WriteDataCubitInitialState());
  }

  void addList() {
    emit(WriteDataCubitLoadingState());
    try {
      List<ListModel> lists = _getListsFromDataBase();
      lists.add(ListModel(
          indexOfList: lists.length,
          listName: listName,
          fromBudget: fromBudget,
          indexicon: indexIcon,
          price: price,
          username: ListModel.user));
      box.put(Hiveconstants.ShoppingListKey, lists);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in addddd list ######################"));
    }
  }

  void deleteList(int indexOfList) {
    emit(WriteDataCubitLoadingState());
    try {
      List<ListModel> lists = _getListsFromDataBase();
      lists.removeAt(indexOfList);
      ReadDataCubit.listdata.clear();
      for (int i = indexOfList; i < lists.length; i++) {
        lists[i] = lists[i].decrementIndexAtDatabase();
        if (lists[i].username.compareTo(ListModel.user) == 0) {
          ReadDataCubit.listdata.add(lists[i]);
        }
      }
      box.put(Hiveconstants.ShoppingListKey, lists);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in delete eee list ######################"));
    }
  }

  List<ListModel> _getListsFromDataBase() =>
      List.from(box.get(Hiveconstants.ShoppingListKey, defaultValue: []))
          .cast<ListModel>();
}
