import 'package:flutter/material.dart';

import '../../widgets/reports/month_budget.dart';
import '../../widgets/reports/monthly_statistics.dart';

class AnalyticsReports extends StatelessWidget {
  const AnalyticsReports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          MonthlyStatistics(),
          MonthlyBudget(),
        ],
      ),
    );
  }
}
