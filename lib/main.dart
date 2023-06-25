import 'package:care_file_one/src/screens/alergia_full_screen.dart';
import 'package:care_file_one/src/screens/alergias_screen.dart';
import 'package:care_file_one/src/screens/cirugias_screen.dart';
import 'package:care_file_one/src/screens/home_screen.dart';
import 'package:care_file_one/src/screens/login_screen.dart';
import 'package:care_file_one/src/screens/medicacion_screen.dart';
import 'package:care_file_one/src/screens/padecimientos_screen.dart';
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
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/alergiasFull',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/alergias': (context) => const AlergiasScreen(),
        '/medicacion': (context) => const MedicacionScreen(),
        '/padecimientos': (context) => const PadecimientosScreen(),
        '/cirugias': (context) => const CirugiasScreen(),
        '/alergiasFull': (context) => const AlergiaFullScreen(
              title: 'Penicilina',
              description: 'texto',
              sintomas: ["uno", "dos"],
              treatment: "no hacer nada",
              type: 'medica',
            )
      },
    );
  }
}
