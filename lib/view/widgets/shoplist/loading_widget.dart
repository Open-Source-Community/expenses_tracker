import 'package:flutter/material.dart';

class LoadimgWidget extends StatelessWidget {
  const LoadimgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(117, 255, 218, 70),
      ),
    );
  }
}
