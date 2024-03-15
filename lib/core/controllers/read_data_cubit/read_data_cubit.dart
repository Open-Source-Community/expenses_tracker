import '/../core/controllers/read_data_cubit/read_data_cubit_states.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../model/list_model.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates> {
  static ReadDataCubit get(context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataCubitInitialState());
  final Box _box = Hive.box(Hiveconstants.ShoppingListBox);
  static List<ListModel> listdata = [];

  void getLists() {
    emit(ReadDataCubitLoadingState());
    try {
      // ignore: non_constant_identifier_names
      listdata.clear();
      List<ListModel> ListToReturn =
          List.from(_box.get(Hiveconstants.ShoppingListKey, defaultValue: []))
              .cast<ListModel>();

      for (int i = 0; i < ListToReturn.length; i++) {
        if (ListToReturn[i].username.compareTo(ListModel.user) == 0) {
          listdata.add(ListToReturn[i]);
        }
        print("All data====================================");
        print(ListToReturn[i].listName);
        print(ListToReturn[i].indexOfList);
        print(ListToReturn[i].fromBudget);
        print(ListToReturn[i].indexicon);
        print(ListToReturn[i].username);
      }
      emit(ReadDataCubitSuccessState(Lists: listdata));
    } catch (e) {
      emit(ReadDataCubitFailedState(
          message:
              "problem in get list########################################"));
    }
  }
}
