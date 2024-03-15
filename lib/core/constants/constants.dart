import 'package:flutter/material.dart';

abstract class Hiveconstants {
  static const String ShoppingListBox = "ListBox";
  static const String ShoppingListKey = "ShoppingList";
  static const String itemsBox = "ItemsBox";
}

abstract class ColorManager {
  static const Color black = Color(0xff1e1e1e);
  static const Color grey = Color.fromARGB(255, 43, 43, 43);
  static const Color yellow = Color(0xffffd946);
  static const Color transparent = Colors.transparent;
}

const List<IconData> shoppingIconslist = const [
  Icons.shopping_cart_outlined,
  Icons.restaurant_menu_outlined,
  Icons.school_outlined,
  Icons.home_outlined,
  Icons.pets_outlined,
  Icons.card_giftcard_outlined,
  Icons.car_crash_outlined,
];
