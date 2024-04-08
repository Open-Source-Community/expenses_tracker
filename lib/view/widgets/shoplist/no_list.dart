import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key, required this.message, required this.icon});
  final String message;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ColorManager.yellow,
            size: 40,
          ),
          Text(
            textAlign: TextAlign.center,
            message,
            style: const TextStyle(
              color: ColorManager.yellow,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
