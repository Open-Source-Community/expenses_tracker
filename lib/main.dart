import 'package:expense_tracker/core/model/incomes_model.dart';
import 'package:expense_tracker/routes.dart';
import 'package:expense_tracker/view/screens/auth/signIn_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/constants/constants.dart';
import 'core/controllers/read_data_cubit/read_data_cubit.dart';
import 'core/controllers/write_data_cubit/write_data_cubit.dart';
import 'core/model/expenses_model.dart';
import 'core/model/list_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpensesModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  Hive.registerAdapter(ListModelAdapter());
  await Hive.openBox<ExpensesModel>('expensesData');
  await Hive.openBox<IncomeModel>('incomeData');
  await Hive.openBox(Hiveconstants.ShoppingListBox);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => writeDataCubit()),
          BlocProvider(create: (context) => ReadDataCubit()..getLists())
        ],
        child: GetMaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          routes: routes,
          home: SignInPage(),
        ));
  }
}
