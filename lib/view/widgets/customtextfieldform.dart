import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;

  final TextEditingController? mycontroller;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  const CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      this.mycontroller,
      this.validate,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validate,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 18, color: Colors.white),
        controller: mycontroller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hinttext,
            labelStyle: const TextStyle(fontSize: 22, color: Colors.white),
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
