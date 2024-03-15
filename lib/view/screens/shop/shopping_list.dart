import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shoplist/add_list.dart';
import '../../widgets/shoplist/shopping_list_body.dart';

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
      ),
      body: const shoppingListBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.yellow,
        onPressed: () =>
            showDialog(context: context, builder: (context) => const AddList()),
        child: const Icon(
          Icons.add,
          color: Color(0xff1e1e1e),
        ),
      ),
    );
  }
}
