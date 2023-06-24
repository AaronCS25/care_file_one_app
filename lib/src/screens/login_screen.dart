import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* LOGO IMG
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 72),
              child: Image.asset(
                'assets/images/logo_care_file_one.jpg',
                width: 250,
                height: 250,
              ),
            ),
            //* DNI INPUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: _dni,
                    decoration: const InputDecoration(
                        hintText: 'DNI', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            //* PASSWPORD INPUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Password'),
                    obscureText: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            //* LOGIN BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(20, 196, 123, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(fontSize: 24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            //* RECUPERACIÓN SESIÓN
            Text(
              '¿No recuerdas tú contraseña?',
              style: GoogleFonts.montserrat(fontSize: 14),
            ),
            const SizedBox(height: 72),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 72),
            //* SIGNUP BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.3))),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(100, 219, 84, 1.0),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
