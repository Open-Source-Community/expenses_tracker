import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final String centerTextTotal;
  CustomPieChart({
    super.key,
    required this.dataMap,
    required this.centerTextTotal,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 80,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: centerTextTotal,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          chartValueBackgroundColor: Colors.transparent,
          chartValueStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      dataMap: dataMap,
    );
  }
}
