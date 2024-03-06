// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../widgets/reports/custom_toggle_switch.dart';
import 'analytics_reports.dart';
import 'manage_accounts.dart';

class ReportsPage extends StatefulWidget {
  ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int currentindex = 0;

  List<Widget> screens = [AnalyticsReports(), ManageAccounts()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        centerTitle: true,
        title: const Text(
          "Reports",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size(10, 60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                CustomToggleSwitch(
                  index: currentindex,
                  labels: ['Analytics', 'Accounts'],
                  onToggle: (index) {
                    setState(() {
                      currentindex = index!;
                    });
                  },
                ),
                SizedBox(height: 25)
              ],
            ),
          ),
        ),
      ),
      body: screens[currentindex],
    );
  }
}
