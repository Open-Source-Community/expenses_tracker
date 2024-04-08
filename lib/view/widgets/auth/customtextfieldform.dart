import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final IconButton? suffix;
  bool isPassword;
  CustomTextField(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      this.mycontroller,
      this.validate,
      this.keyboardType,
      this.suffix,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validate,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 18, color: Colors.white),
        controller: mycontroller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(labeltext)),
            hintText: hinttext,
            suffixIcon: suffix,
            labelStyle: const TextStyle(fontSize: 22, color: Colors.white),
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
