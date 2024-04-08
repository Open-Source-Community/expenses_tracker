// ignore_for_file: avoid_print

import 'package:expense_tracker/cubit/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../data/local/sqlflite.dart';
import '../../model/UserModel.dart';
import '../../model/expenses_model.dart';
import '../../model/incomes_model.dart';
import '../../model/list_model.dart';
import '../read_data_cubit/read_data_cubit.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  static String userName = "";
  static String userEmail = "";
  bool visible = false;
  bool isPassword = true;

  void login() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      print("Valid");
      String userValue = username.text.trim();
      String passValue = password.text.trim();
      SqlDB db = SqlDB();

      if (userValue.isNotEmpty && passValue.isNotEmpty) {
        UserModel? user = await db.getUser(userValue);
        if (user?.password.compareTo(passValue) == 0) {
          ExpensesModel.user = user!.username;
          IncomeModel.user = user.username;
          ListModel.user = user.username;
          ExpensesModel.expensesList.clear();
          IncomeModel.incomeList.clear();
          ReadDataCubit.listData.clear();
          for (var element in ExpensesModel.notifierListener.value) {
            if (element.username?.compareTo(user.username) == 0) {
              ExpensesModel.expensesList.add(element);
            }
          }
          for (var element in IncomeModel.notifierListener.value) {
            if (element.username?.compareTo(user.username) == 0) {
              IncomeModel.incomeList.add(element);
            }
          }
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState());
          showToast(text: "Invalid username or password!", color: Colors.red);
        }
      } else {
        emit(LoginErrorState());
        showToast(text: "Invalid Input", color: Colors.red);
      }
    } else {
      print("Not Valid");
      showToast(text: "Invalid Input", color: Colors.red);
    }
  }

  void showPassword() {
    visible = !visible;
    isPassword = !isPassword;
    emit(LoginChangePasswordIconState());
  }

  void goToSignUp() {
    username.clear();
    password.clear();
    emit(LoginClearTextController());
    emit(LoginGoToSignUpState());
  }
}
