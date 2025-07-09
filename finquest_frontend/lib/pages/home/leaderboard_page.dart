import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = [
      {"name": "Mansi", "xp": 240, "badge": "🔥 5-Day Streak"},
      {"name": "Aryan", "xp": 180, "badge": "💰 Saved ₹500"},
      {"name": "Riya", "xp": 160, "badge": "🎯 Challenge Winner"},
    ];

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Leaderboard",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Compete with your friends and unlock rewards!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemCount: leaderboard.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final user = leaderboard[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade100,
                      child: Text("${index + 1}"),
                    ),
                    title: Text(user['name'] as String),

                    subtitle: Text("Badge: ${user['badge'] as String}"),
                    trailing: Text("XP: ${user['xp']}"),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.indigoAccent),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Your Streak",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "🔥 5-Day Streak – Keep saving!",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
