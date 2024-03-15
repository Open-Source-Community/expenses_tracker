import '/../view/widgets/shoplist/create_button.dart';
import '/../view/widgets/shoplist/icon_row.dart';
import '../../../core/controllers/read_data_cubit/read_data_cubit.dart';
import '/../view/widgets/shoplist/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/constants.dart';
import '../../../core/controllers/write_data_cubit/write_data_cubit.dart';
import '../../../core/controllers/write_data_cubit/write_data_cubit_states.dart';
import 'from_budget.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: BlocConsumer<writeDataCubit, WriteDataCubitStates>(
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
                    },
                    onChanged: (val) =>
                        writeDataCubit.get(context).UpdateListName(val),
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
                    onChanged: (val) => writeDataCubit
                        .get(context)
                        .UpdatePrice(double.parse(val)),
                    controller: priceController,
                    label: "Price"),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Icon ",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconRow(activeIndex: writeDataCubit.get(context).indexIcon),
                FromBudget(
                  fromBudget: writeDataCubit.get(context).fromBudget,
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
                          writeDataCubit.get(context).addList();
                          ReadDataCubit.get(context).getLists();
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
