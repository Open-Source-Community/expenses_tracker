import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/constants/constants.dart';
import '../../model/list_model.dart';
import 'read_data_cubit.dart';
import 'write_data_cubit_states.dart';

class WriteDataCubit extends Cubit<WriteDataCubitStates> {
  static WriteDataCubit get(context) => BlocProvider.of(context);
  WriteDataCubit() : super(WriteDataCubitInitialState());

  final Box box = Hive.box(Hiveconstants.shoppingListBox);
  String listName = "";
  bool fromBudget = false;
  int indexIcon = 0;
  int indexOfList = 0;
  double price = 0.0;

  void updateListName(String listName) {
    this.listName = listName;
  }

  void updateIndexIcon(int index) {
    indexIcon = index;
    emit(WriteDataCubitInitialState());
  }

  void updatePrice(double price) {
    this.price = price;
    emit(WriteDataCubitInitialState());
  }

  void updateFromBudget(bool check) {
    fromBudget = check;
    emit(WriteDataCubitInitialState());
  }

  void addList() {
    emit(WriteDataCubitLoadingState());
    try {
      // ShoppingList
      List<ListModel> lists = _getListsFromDataBase();
      lists.add(ListModel(
          indexOfList: lists.length,
          listName: listName,
          fromBudget: fromBudget,
          indexicon: indexIcon,
          price: price,
          username: ListModel.user));
      box.put(Hiveconstants.shoppingListKey, lists);

      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in added list ######################"));
    }
  }

  void deleteList(int indexOfList) {
    emit(WriteDataCubitLoadingState());
    try {
      List<ListModel> lists = _getListsFromDataBase();
      lists.removeAt(indexOfList);
      ReadDataCubit.listData.clear();
      for (int i = indexOfList; i < lists.length; i++) {
        lists[i] = lists[i].decrementIndexAtDatabase();
        if (lists[i].username.compareTo(ListModel.user) == 0) {
          ReadDataCubit.listData.add(lists[i]);
        }
      }
      box.put(Hiveconstants.shoppingListKey, lists);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(
          message: "failed in delete eee list ######################"));
    }
  }

  List<ListModel> _getListsFromDataBase() =>
      List.from(box.get(Hiveconstants.shoppingListKey, defaultValue: []))
          .cast<ListModel>();
}
