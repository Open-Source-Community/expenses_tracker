import 'package:expenses_tracker/core/model/expenses_model.dart';
import 'package:expenses_tracker/view/widgets/reports/piechart.dart';
import 'package:flutter/material.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ChartsPage extends StatefulWidget {
  ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  List items = ['Expenses', 'Income'];
  String dropvalue = 'Expenses';
  Map<String, double> dataMap = Expenses.dataMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff212121),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(10, 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                ),
                ToggleSwitch(
                  minWidth: 164,
                  borderWidth: 1.5,
                  borderColor: const [Colors.white70],
                  initialLabelIndex: 0,
                  cornerRadius: 5,
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey.shade900,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['Expenses', 'Income'],
                  activeBgColors: const [
                    [Colors.white],
                    [Colors.white]
                  ],
                  minHeight: 30,
                  fontSize: 18,
                  onToggle: (index) {
                    print('switched to: $index');
                    setState(() {
                      dataMap = Expenses.data;
                    });
                  },
                ),
                const SizedBox(height: 25)
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.grey.shade600, width: 0.4)),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 26, 26, 26)),
                child: CustomPieChart(dataMap: dataMap)),
            ExpensesItem(
              title: Expenses.dataMap.keys.first,
              iconData: Icons.electrical_services,
              price: "1,710",
            ),
            ExpensesItem(
              title: Expenses.dataMap.keys.elementAt(1),
              iconData: Icons.directions_car_sharp,
              price: "1,710",
            ),
            ExpensesItem(
              title: Expenses.dataMap.keys.last,
              iconData: Icons.widgets,
              price: "1,710",
            )
          ],
        ),
      ),
    );
  }
}

class ExpensesItem extends StatelessWidget {
  final String title;
  final String price;
  final IconData iconData;
  ExpensesItem({
    super.key,
    required this.title,
    required this.price,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 21, 21, 21),
        child: Icon(
          iconData,
          color: Colors.amber,
        ),
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      trailing: Text(price,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
             // child: DropdownButton(
                  //   iconSize: 35,
                  //   iconEnabledColor: Colors.white,
                  //   style: const TextStyle(
                  //       fontSize: 20, fontWeight: FontWeight.bold),
                  //   value: dropvalue,
                  //   items: items.map((items) {
                  //     return DropdownMenuItem(child: Text(items), value: items);
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       dropvalue = value.toString();
                  //       dataMap = Expenses.data;
                  //     });
                  //     setState(() {});
                  //   },
                  // ),