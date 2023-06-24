import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _dni = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _dni,
              decoration: const InputDecoration(labelText: 'DNI'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            const Text('¿No recuerdas tú contraseña?'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: const Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
