import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'list_model.g.dart';

@HiveType(typeId: 2)
class ListModel extends HiveObject {
  @HiveField(0)
  String listName;
  @HiveField(1)
  int indexicon;
  @HiveField(2)
  int indexOfList;
  @HiveField(3)
  bool fromBudget;
  @HiveField(4)
  double price;
  @HiveField(5)
  String username;
  static String user = "no user";
  ListModel({
    this.indexOfList = -1,
    this.listName = "",
    this.username = "no user",
    this.fromBudget = false,
    this.indexicon = -1,
    this.price = 0.0,
  });

  static List<IconData> shoppingIconslist = [
    Icons.shopping_cart_outlined,
    Icons.restaurant_menu_outlined,
    Icons.school_outlined,
    Icons.home_outlined,
    Icons.pets_outlined,
    Icons.card_giftcard_outlined,
    Icons.car_crash_outlined,
  ];
  ListModel decrementIndexAtDatabase() {
    return ListModel(
      username: user,
      price: price,
      indexOfList: indexOfList - 1,
      listName: listName,
      fromBudget: fromBudget,
      indexicon: indexicon,
    );
  }
}
