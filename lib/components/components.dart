import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
void navigateToReplacement(context, Widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
void showToast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor: Colors.white,
      textColor: color,
      fontSize: 16.0,
    );

validInput(String value, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not valid email";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(value)) {
      return "Not valid Input enter numbers only";
    }
  }
  if (value.isEmpty) {
    return "can't be Empty!";
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be larger than $max";
  }
}
