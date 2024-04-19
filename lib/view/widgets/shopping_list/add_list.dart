import 'create_button.dart';
import 'icon_row.dart';
import '../../../cubit/shoppinglist_cubit/read_data_cubit.dart';
import 'custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/constants/constants.dart';
import '../../../cubit/shoppinglist_cubit/write_data_cubit.dart';
import '../../../cubit/shoppinglist_cubit/write_data_cubit_states.dart';
import 'from_budget.dart';

class AddList extends StatelessWidget {
  AddList({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: BlocConsumer<WriteDataCubit, WriteDataCubitStates>(
      listener: (context, state) {
        if (state is WriteDataCubitSuccessState) {
          Navigator.pop(context);
        }
        if (state is WriteDataCubitFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: ColorManager.yellow,
          ));
        }
      },
      builder: (context, state) {
        WriteDataCubit cubit = WriteDataCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text(
                  "Add Shopping List",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                CustomFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (val) =>
                        WriteDataCubit.get(context).updateListName(val),
                    controller: nameController,
                    label: "List Name"),
                CustomFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    onChanged: (val) => cubit.updatePrice(double.parse(val)),
                    controller: priceController,
                    label: "Price"),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Icon ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconRow(activeIndex: cubit.indexIcon),
                FromBudget(
                  fromBudget: cubit.fromBudget,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CreateButton(
                      label: "Add",
                      OnTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.addList();
                          ReadDataCubit.get(context).getLists();
                          cubit.updateFromBudget(false);
                          cubit.updateIndexIcon(0);
                        }
                      },
                    ),
                  ],
                )
              ]),
            ),
          ),
        );
      },
    ));
  }
}
