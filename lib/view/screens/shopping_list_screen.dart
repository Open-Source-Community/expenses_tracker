import 'package:flutter/material.dart';
import '../../components/constants/constants.dart';
import '../widgets/shopping_list/add_list.dart';
import '../widgets/shopping_list/bar_details.dart';
import '../widgets/shopping_list/shopping_list_body.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.grey,
          title: const Text(
            "Shopping list",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          bottom: const PreferredSize(
              preferredSize: Size(10, 90),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    BarDetails(),
                    SizedBox(height: 25),
                  ])))),
      body: const shoppingListBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.yellow,
        onPressed: () =>
            showDialog(context: context, builder: (context) => AddList()),
        child: const Icon(
          Icons.add,
          color: Color(0xff1e1e1e),
        ),
      ),
    );
  }
}
