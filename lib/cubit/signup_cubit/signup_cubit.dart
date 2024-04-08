import 'package:expense_tracker/cubit/signup_cubit/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../components/constants/routes.dart';
import '../../data/local/sqlflite.dart';
import '../../model/UserModel.dart';
import '../../model/expenses_model.dart';
import '../../model/incomes_model.dart';
import '../../model/list_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> keystate = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = false;
  bool isPassword = true;

  void signUp() async {
    var foredate = keystate.currentState;

    if (foredate!.validate()) {
      print("Valid");
      String userValue = username.text.trim();
      String confirm = confirmPassword.text.trim();
      String passValue = password.text.trim();
      SqlDB db = SqlDB();
      UserModel user =
          UserModel(username: username.text, password: password.text);

      if (passValue.compareTo(confirm) == 0) {
        ExpensesModel.user = username.text;
        IncomeModel.user = username.text;
        ListModel.user = user.username;
        int? response = await db.insertUser(user);
        if (response != null) {
          emit(SignUpSuccessState());
        } else {
          emit(SignUpErrorState());
        }
      } else if (password.text.compareTo(confirmPassword.text) != 0) {
        emit(SignUpErrorState());
      } else {
        emit(SignUpErrorState());
      }
    } else {
      print("Not Valid");
      showToast(text: "Invalid Input", color: Colors.red);
    }
  }

  void showPassword() {
    visible = !visible;
    isPassword = !isPassword;
    emit(SignUpChangePasswordIconState());
  }

  void goToLogin() {
    confirmPassword.clear();
    password.clear();
    username.clear();
    emit(SignUpClearTextController());
    emit(SignUpGoToLogin());
  }
}
