import 'package:flutter/material.dart';

abstract class Hiveconstants {
  static const String shoppingListBox = "ListBox";
  static const String shoppingListKey = "ShoppingList";
  static const String itemsShoppingListBox = "ItemsBox";
  static const String expensesListBox = "ListBox";
  static const String expensesListKey = "ExpensesList";
  static const String itemExpensesBox = "ItemsBox";
  static const String incomesListBox = "ListBox";
  static const String incomesListKey = "IncomesList";
  static const String itemIncomesBox = "ItemsBox";
}

abstract class ColorManager {
  static const Color black = Color(0xff1e1e1e);
  static const Color grey = Color.fromARGB(255, 43, 43, 43);
  static const Color yellow = Color(0xffffd946);
  static const Color transparent = Colors.transparent;
}

const List<IconData> shoppingIconsList = [
  Icons.shopping_cart_outlined,
  Icons.restaurant_menu_outlined,
  Icons.school_outlined,
  Icons.home_outlined,
  Icons.pets_outlined,
  Icons.card_giftcard_outlined,
  Icons.car_crash_outlined,
];
