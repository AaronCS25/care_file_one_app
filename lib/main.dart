import 'package:care_file_one/src/screens/login_screen.dart';
import 'package:care_file_one/src/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareFile-One',
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
