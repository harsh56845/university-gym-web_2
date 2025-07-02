import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("User Home", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                // TODO: Implement logout
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              tooltip: "Logout",
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to HBTU Gym 🏋️",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Your fitness journey starts here!",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Image.network(
                  'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.assignment),
                    label: const Text(
                      "Register for Gym",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/gym-reg');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
