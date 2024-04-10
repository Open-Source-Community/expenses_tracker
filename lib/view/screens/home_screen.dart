import 'package:expense_tracker/cubit/records_cubit/read_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/write_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/write_records_states.dart';
import 'package:expense_tracker/model/expenses_model.dart';
import 'package:expense_tracker/model/incomes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/constants/constants.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/home_cubit/home_states.dart';
import '../widgets/records/categories_list.dart';
import '../../components/custom_toggle_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int sliding = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarCubit, NavbarState>(
      builder: (context, state) {
        NavBarCubit cubit = NavBarCubit.get(context);
        return Scaffold(
          body: cubit.screens.elementAt(cubit.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.text_snippet,
                  ),
                  label: "Records"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pie_chart_outline_sharp,
                  ),
                  label: "Charts"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.receipt_long_outlined,
                  ),
                  label: "Reports"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Me"),
            ],
            currentIndex: cubit.currentIndex,
            backgroundColor: const Color.fromARGB(255, 43, 43, 43),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.yellow,
            iconSize: 30,
            onTap: (value) {
              cubit.changeSelectedIndex(value);
              ReadRecordsCubit.get(context).setSliding();
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showBottomSheetToAddRecord(context);
            },
            backgroundColor: ColorManager.yellow,
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  showBottomSheetToAddRecord(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (context) {
        return BlocConsumer<WriteRecordsCubit, WriteRecordsCubitStates>(
            listener: (context, state) {},
            builder: (context, state) {
              WriteRecordsCubit cubit = WriteRecordsCubit.get(context);
              return Center(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff1c1c1c),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                    children: [
                      AppBar(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        leading: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            WriteRecordsCubit.sliding = 0;
                            WriteRecordsCubit.get(context).updateIndexIcon(-1);
                            WriteRecordsCubit.amountController.clear();
                            ReadRecordsCubit.get(context).setSliding();
                          },
                          child: const Center(
                            child: Text("Cancel",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ),
                        ),
                        centerTitle: true,
                        title: const Text("Add",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.yellow)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: CustomToggleSwitch(
                            index: WriteRecordsCubit.sliding,
                            labels: const ['Expenses', 'Income'],
                            onToggle: (newValue) {
                              WriteRecordsCubit.sliding = newValue!;
                              cubit.toggle();
                              cubit.updateIndexIcon(-1);
                            }),
                      ),
                      BlocBuilder<WriteRecordsCubit, WriteRecordsCubitStates>(
                        builder: (context, state) {
                          if (WriteRecordsCubit.sliding == 0) {
                            return CategoriesList(
                                length: ExpensesModel.expensesCategories.length,
                                categories: ExpensesModel.expensesCategories);
                          } else if (WriteRecordsCubit.sliding == 1) {
                            return CategoriesList(
                                length: IncomeModel.incomeCategories.length,
                                categories: IncomeModel.incomeCategories);
                          } else {
                            return CategoriesList(
                                length: ExpensesModel.expensesCategories.length,
                                categories: ExpensesModel.expensesCategories);
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
