// ignore_for_file: avoid_print

import 'read_data_cubit_states.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/constants/constants.dart';
import '../../model/list_model.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates> {
  static ReadDataCubit get(context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataCubitInitialState());
  final Box _box = Hive.box(Hiveconstants.shoppingListBox);
  static List<ListModel> listData = [];
  static double total = 0.0;
  void getLists() {
    emit(ReadDataCubitLoadingState());
    try {
      listData.clear();
      total = 0.0;
      List<ListModel> listToReturn =
          List.from(_box.get(Hiveconstants.shoppingListKey, defaultValue: []))
              .cast<ListModel>();

      for (int i = 0; i < listToReturn.length; i++) {
        if (listToReturn[i].username.compareTo(ListModel.user) == 0) {
          listData.add(listToReturn[i]);
          if (listToReturn[i].fromBudget == true) {
            total += listToReturn[i].price;
          }
        }
      }
      emit(ReadDataCubitSuccessState(Lists: listData));
    } catch (e) {
      emit(ReadDataCubitFailedState(message: "Problem in get list :("));
    }
  }
  void notDelete(){
     emit(ReadDataCubitSuccessState(Lists: listData));
  }
}
