import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';

class InformationBar extends StatelessWidget {
  final String title;
  final String data;
  const InformationBar({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: ColorManager.yellow,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        Text(
          data,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ],
    );
  }
}
