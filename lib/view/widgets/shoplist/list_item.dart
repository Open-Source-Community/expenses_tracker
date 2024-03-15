import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/model/list_model.dart';
import 'list_icon.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.list,
  });
  final ListModel list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        leading: ListIcon(icon: shoppingIconslist[list.indexicon]),
        title: Text(
          list.listName,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        subtitle: list.fromBudget
            ? const Text("from Budget",
                style: TextStyle(color: Color.fromARGB(255, 91, 90, 90)))
            : null,
        trailing: Text(
          list.price.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color.fromARGB(255, 62, 62, 62))),
      ),
    );
  }
}
