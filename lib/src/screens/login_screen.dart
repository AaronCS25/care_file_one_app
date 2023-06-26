import 'package:care_file_one/apis/login_api_service.dart';
import 'package:care_file_one/models/user_model/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  final LoginApiService _loginApiService = LoginApiService();

  final TextEditingController _dni = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _dni.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formLoginKey,
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
                child: TextFormField(
                  controller: _dni,
                  decoration: InputDecoration(
                    hintText: 'DNI',
                    filled: true,
                    fillColor: const Color.fromRGBO(93, 93, 93, 0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite su DNI';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              //* PASSWPORD INPUT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color.fromRGBO(93, 93, 93, 0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
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
                    onPressed: () {
                      if (_formLoginKey.currentState?.validate() ?? false) {
                        final loginRequestModel = LoginRequestModel(
                            dni: _dni.text, password: _password.text);

                        final scaffoldMessenger = ScaffoldMessenger.of(context);

                        _loginApiService
                            .loginUser(loginRequestModel)
                            .then((success) {
                          if (success) {
                            scaffoldMessenger.showSnackBar(
                              const SnackBar(
                                content: Text('Inicio de sesión exitoso!'),
                              ),
                            );
                          } else {
                            //TODO: AGREGAR UN MEJOR OVERLAY
                            final overlayState = Overlay.of(context);
                            final overlayEntry = OverlayEntry(
                              builder: (context) => Positioned(
                                top:
                                    50, // Ajusta este valor para cambiar la posición vertical del mensaje
                                width: MediaQuery.of(context).size.width,
                                child: const Center(
                                  child: Card(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Falló inicio de sesión!',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );

                            overlayState.insert(overlayEntry);

                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                overlayEntry.remove();
                              },
                            );
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(20, 196, 123, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      'Login',
                      style: GoogleFonts.montserrat(
                          fontSize: 24, color: Colors.white),
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
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
      ),
    );
  }
}
