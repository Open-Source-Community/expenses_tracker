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

  void getLists() {
    emit(ReadDataCubitLoadingState());
    try {
      // ignore: non_constant_identifier_names
      listData.clear();
      List<ListModel> ListToReturn =
          List.from(_box.get(Hiveconstants.shoppingListKey, defaultValue: []))
              .cast<ListModel>();

      for (int i = 0; i < ListToReturn.length; i++) {
        if (ListToReturn[i].username.compareTo(ListModel.user) == 0) {
          listData.add(ListToReturn[i]);
        }
        print("All data====================================");
        print(ListToReturn[i].listName);
        print(ListToReturn[i].indexOfList);
        print(ListToReturn[i].fromBudget);
        print(ListToReturn[i].indexicon);
        print(ListToReturn[i].username);
      }
      emit(ReadDataCubitSuccessState(Lists: listData));
    } catch (e) {
      emit(ReadDataCubitFailedState(
          message:
              "problem in get list########################################"));
    }
  }
}
