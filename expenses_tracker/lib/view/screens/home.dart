// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:expenses_tracker/view/screens/account.dart';
import 'package:expenses_tracker/view/screens/charts.dart';
import 'package:expenses_tracker/view/screens/records.dart';
import 'package:expenses_tracker/view/screens/reports/reports.dart';
import 'package:expenses_tracker/view/widgets/reports/custom_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    const RecordsPage(),
    ChartsPage(),
    ReportsPage(),
    const AccountPage()
  ];
  List expensesCategories = [
    {"name": "Shopping", "icon": Icons.shopping_cart_outlined},
    {"name": "Food", "icon": Icons.food_bank_outlined},
    {"name": "Telephone", "icon": Icons.phone_android_outlined},
    {"name": "Entertainment", "icon": Icons.mic},
    {"name": "Education", "icon": Icons.book_rounded},
    {"name": "Sport", "icon": Icons.sports_score_sharp},
    {"name": "Social", "icon": Icons.social_distance},
    {"name": "Car", "icon": Icons.directions_car_sharp},
  ];
  List incomeCategories = [
    {"name": "Shopping", "icon": Icons.shopping_cart_outlined},
    {"name": "Food", "icon": Icons.food_bank_outlined},
    {"name": "Telephone", "icon": Icons.phone_android_outlined},
    {"name": "Entertainment", "icon": Icons.mic},
  ];
  int currentIndex = 0;
  int sliding = 0;
  int select = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.text_snippet,
              ),
              label: "Records"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.pie_chart_outline_sharp,
              ),
              label: "Charts"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long_outlined,
              ),
              label: "Reports"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Me"),
        ],
        currentIndex: currentIndex,
        backgroundColor: const Color(0xff212121),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            context: context,
            builder: (context) {
              return Center(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff1c1c1c),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                    children: [
                      AppBar(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        leading: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Center(
                              child: Text("Cancel",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500))),
                        ),
                        centerTitle: true,
                        title: const Text("Add",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: CustomToggleSwitch(
                            index: sliding,
                            labels: ['Expenses', 'Income'],
                            onToggle: (newValue) {
                              setState(() {
                                sliding = newValue!;
                              });
                            }),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 0.5, crossAxisCount: 4),
                        itemCount: sliding == 0
                            ? expensesCategories.length
                            : incomeCategories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                select = index;
                                print(select);
                              });
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: select == index
                                      ? Colors.amber
                                      : const Color.fromARGB(255, 63, 63, 63),
                                  child: Icon(
                                    sliding == 0
                                        ? expensesCategories[index]["icon"]
                                        : incomeCategories[index]["icon"],
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                    sliding == 0
                                        ? expensesCategories[index]["name"]
                                        : incomeCategories[index]["name"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white))
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
