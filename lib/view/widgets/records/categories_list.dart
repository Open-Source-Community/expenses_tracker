import 'package:expense_tracker/components/constants/routes.dart';
import 'package:expense_tracker/cubit/records_cubit/write_records_cubit.dart';
import 'package:expense_tracker/cubit/records_cubit/write_records_states.dart';
import 'package:expense_tracker/view/widgets/auth/customtextfieldform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../components/constants/constants.dart';
import '../../../components/components.dart';
import '../../../cubit/records_cubit/read_records_cubit.dart';

class CategoriesList extends StatelessWidget {
  final int length;
  final List categories;

  const CategoriesList({
    super.key,
    required this.length,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    WriteRecordsCubit cubit = WriteRecordsCubit.get(context);
    return BlocConsumer<WriteRecordsCubit, WriteRecordsCubitStates>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0.5, crossAxisCount: 4),
          itemCount: length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onDoubleTap: () {
                cubit.updateIndexIcon(-1);
              },
              onTap: () {
                cubit.updateIndexIcon(index);
                addRecords(context, cubit);
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor:
                        cubit.indexIcon == index && cubit.indexIcon != -1
                            ? ColorManager.yellow
                            : const Color.fromARGB(255, 63, 63, 63),
                    child: Icon(
                      categories[index]["icon"],
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(categories[index]["name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white))
                ],
              ),
            );
          },
        );
      },
      listener: (context, state) {
        WriteRecordsCubit.dateController.text =
            DateFormat.yMMMMEEEEd().format(DateTime.now());
      },
    );
  }

  addRecords(BuildContext context, WriteRecordsCubit cubit) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Form(
              key: WriteRecordsCubit.formstate,
              child: AlertDialog(
                scrollable: true,
                title: Center(
                  child: Text(
                    WriteRecordsCubit.sliding == 0
                        ? "Add Expenses"
                        : "Add Income",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.yellow),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                backgroundColor: const Color(0xff212121),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    CustomTextField(
                      onChanged: (val) {
                        cubit.updateAmount(double.parse(val));
                      },
                      labeltext: "Amount",
                      keyboardType: TextInputType.number,
                      hinttext: "Enter amount ",
                      mycontroller: WriteRecordsCubit.amountController,
                      validate: (val) {
                        return validInput(val!, 1, 10, "number");
                      },
                      isPassword: false,
                      suffix: IconButton(
                          icon: const Icon(Icons.monetization_on),
                          onPressed: () {},
                          color: ColorManager.yellow),
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _getDate(context).then((value) {
                                cubit.updateDate(value!);
                              });
                            },
                            child: const Icon(
                              Icons.calendar_month_outlined,
                              color: ColorManager.yellow,
                            )),
                        Text(
                          "  Date: ${WriteRecordsCubit.dateController.text}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        switch (WriteRecordsCubit.sliding) {
                          case 0:
                            cubit.addExpenses();
                            ReadRecordsCubit.get(context).getLists();
                            break;
                          case 1:
                            cubit.addIncomes();
                            ReadRecordsCubit.get(context).getLists();
                            break;
                          default:
                            break;
                        }
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.homepage);
                        cubit.updateIndexIcon(-1);
                        WriteRecordsCubit.sliding = 0;
                        ReadRecordsCubit.slidingCharts = 0;
                        ReadRecordsCubit.slidingRecords = 0;
                        WriteRecordsCubit.amountController.clear();
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.yellow),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        WriteRecordsCubit.sliding = 0;
                        ReadRecordsCubit.slidingCharts = 0;
                        ReadRecordsCubit.slidingRecords = 0;
                        cubit.updateIndexIcon(-1);
                        WriteRecordsCubit.amountController.clear();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )),
                ],
              ),
            ));
  }

  Future<DateTime?> _getDate(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.input,
        firstDate: DateTime.now(),
        lastDate: DateTime.parse('2025-12-03'));
  }
}
