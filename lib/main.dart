import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/admin_dashboard_page.dart';
import 'package:gym_app/screens/gym_registration_page.dart';
import 'package:gym_app/screens/user_home_page.dart';
import 'screens/home_page.dart';
import 'screens/user_login_page.dart';
import 'screens/user_signup_page.dart';
import 'screens/admin_login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HBTU Gym',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/user-login': (context) => const UserLoginPage(),
        '/user-signup': (context) => const UserSignupPage(),
        '/admin-login': (context) => const AdminLoginPage(),
        '/admin-dashboard': (context) => const AdminDashboardPage(),
        '/user-home': (context) => const UserHomePage(),
        '/gym-reg': (context) => const GymRegistrationPage(),
      },
    );
  }
}
