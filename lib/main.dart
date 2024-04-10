import 'package:expense_tracker/cubit/home_cubit/home_cubit.dart';
import 'package:expense_tracker/model/incomes_model.dart';
import 'package:expense_tracker/routes.dart';
import 'package:expense_tracker/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'components/constants/bloc_observer.dart';
import 'components/constants/constants.dart';
import 'cubit/records_cubit/read_records_cubit.dart';
import 'cubit/records_cubit/write_records_cubit.dart';
import 'cubit/login_cubit/login_cubit.dart';
import 'cubit/onboarding_cubit/onboarding_cubit.dart';
import 'cubit/shoppinglist_cubit/read_data_cubit.dart';
import 'cubit/signup_cubit/signup_cubit.dart';
import 'cubit/shoppinglist_cubit/write_data_cubit.dart';
import 'model/expenses_model.dart';
import 'model/list_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpensesModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  Hive.registerAdapter(ListModelAdapter());
  await Hive.openBox(Hiveconstants.expensesListBox);
  await Hive.openBox(Hiveconstants.incomesListBox);
  await Hive.openBox(Hiveconstants.shoppingListBox);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => SignUpCubit()),
          BlocProvider(create: (context) => OnBoardingCubit()),
          BlocProvider(create: (context) => WriteDataCubit()),
          BlocProvider(create: (context) => WriteRecordsCubit()),
          BlocProvider(create: (context) => ReadDataCubit()..getLists()),
          BlocProvider(create: (context) => ReadRecordsCubit()..getLists()),
          BlocProvider(create: (context) => NavBarCubit()),
         
        ],
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          routes: routes,
          home: const LoginScreen(),
        ));
  }
}
