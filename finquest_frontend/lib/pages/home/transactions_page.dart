import 'package:flutter/material.dart';
import '../../services/sms_service.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final SmsService smsService = SmsService();

  List<Map<String, dynamic>> transactions = [];
  bool isLoading = true;

  // Fallback dummy transactions
  final List<Map<String, dynamic>> fallbackTransactions = [
    {"title": "Zomato", "category": "Food", "amount": 320, "date": "8 Jul"},
    {"title": "Metro Card", "category": "Travel", "amount": 100, "date": "7 Jul"},
    {"title": "Amazon", "category": "Shopping", "amount": 1450, "date": "6 Jul"},
    {"title": "PG Rent", "category": "Rent", "amount": 5000, "date": "5 Jul"},
    {"title": "Movie", "category": "Entertainment", "amount": 250, "date": "4 Jul"},
  ];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    final data = await smsService.fetchSmsTransactions();

    setState(() {
      // If API gives nothing, fall back to dummy data
      transactions = data.isNotEmpty ? data : fallbackTransactions;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),

            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: ListView.separated(
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    return ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        child: Text(tx['category'][0]),
                      ),
                      title: Text(tx['title']),
                      subtitle: Text(tx['category']),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "- ₹${tx['amount']}",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tx['date'],
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
