import 'package:expense_tracker/view/widgets/auth/LoginForm.dart';
import 'package:expense_tracker/view/widgets/customtextfieldform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final int length;
  final List categories;

  CategoriesList({
    super.key,
    required this.length,
    required this.categories,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

int selectItem = -1;

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0.5, crossAxisCount: 4),
      itemCount: widget.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onDoubleTap: () {
            setState(() {
              selectItem = -1;
            });
          },
          onTap: () {
            setState(() {
              selectItem = index;
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        backgroundColor: const Color(0xff212121),
                        content: const CustomTextFormAuth(
                          keyboardType: TextInputType.number,
                          hinttext: "Enter amount ",
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  selectItem = -1;
                                });
                              },
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  selectItem = -1;
                                });
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              )),
                        ],
                      ));
            });
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: selectItem == index && selectItem != -1
                    ? Colors.amber
                    : const Color.fromARGB(255, 63, 63, 63),
                child: Icon(
                  widget.categories[index]["icon"],
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(widget.categories[index]["name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white))
            ],
          ),
        );
      },
    );
  }
}
