import 'package:flutter/material.dart';
import '../../widgets/pie_chart_widget.dart'; // Custom reusable widget

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data: category -> amount
    final Map<String, double> expenseData = {
      "Food": 3500,
      "Rent": 5000,
      "Travel": 1500,
      "Shopping": 2000,
      "Others": 1000,
    };

    final total = expenseData.values.fold(0.0, (a, b) => a + b);

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Spending Breakdown",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 24),

            // Pie chart
            PieChartWidget(data: expenseData),

            const SizedBox(height: 24),
            const Text(
              "Category-wise Expenses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            ...expenseData.entries.map(
              (entry) {
                final percent = ((entry.value / total) * 100).toStringAsFixed(1);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    child: Text(entry.key[0]),
                  ),
                  title: Text(entry.key),
                  subtitle: Text("₹${entry.value.toStringAsFixed(0)}"),
                  trailing: Text("$percent%"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
