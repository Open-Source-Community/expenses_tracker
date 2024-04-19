import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key, required this.OnTap, required this.label});
  final VoidCallback OnTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: OnTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              color: ColorManager.yellow,
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorManager.black,
            ),
          ),
        ),
      ),
    );
  }
}
