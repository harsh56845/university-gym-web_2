import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Admin Dashboard",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context); // logout logic here
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              tooltip: "Logout",
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome, Admin 👋",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Responsive Dashboard Cards using Wrap
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  _DashboardCard(
                    title: "Total Members",
                    value: "245",
                    icon: Icons.people,
                  ),
                  _DashboardCard(
                    title: "Trainers",
                    value: "5",
                    icon: Icons.fitness_center,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                "Quick Actions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to members list
                    },
                    icon: const Icon(Icons.group),
                    label: const Text("View Members"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to add notice screen
                    },
                    icon: const Icon(Icons.announcement),
                    label: const Text("Add Notice"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to reports
                    },
                    icon: const Icon(Icons.bar_chart),
                    label: const Text("Reports"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 600 ? 250.0 : double.infinity;

    return SizedBox(
      height: 150,
      width: cardWidth,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.blueAccent),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(title, style: const TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
