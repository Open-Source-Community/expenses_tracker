import 'package:expense_tracker/core/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class FromBudget extends StatelessWidget {
  const FromBudget({
    super.key,
    required this.fromBudget,
  });
  final bool fromBudget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "From Budget",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Switch(
          activeColor: ColorManager.yellow,
          value: fromBudget,
          onChanged: (value) =>
              writeDataCubit.get(context).UpdatefromBudget(!fromBudget),
        ),
      ],
    );
  }
}
