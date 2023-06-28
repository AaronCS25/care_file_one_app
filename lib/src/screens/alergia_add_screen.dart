import 'package:care_file_one/apis/alergia_api_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AlergiaAddScreen extends StatefulWidget {
  const AlergiaAddScreen({super.key});

  @override
  State<AlergiaAddScreen> createState() => _AlergiaAddScreenState();
}

class _AlergiaAddScreenState extends State<AlergiaAddScreen> {
  final GlobalKey<FormState> _formAlergiaAdd = GlobalKey<FormState>();
  final AlergiaApiService _alergiaApiService = AlergiaApiService();

  final TextEditingController _title = TextEditingController();

  List<String> types = ["alimenticia", "ambiental", "animal", "medica"];
  String type = "alimenticia";

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD ALERGIAS',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formAlergiaAdd,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre de la alergia',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: _title,
                          decoration: InputDecoration(
                            hintText: 'Apis melife...',
                            filled: true,
                            fillColor: const Color.fromRGBO(93, 93, 93, 0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 13.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipo',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: type,
                              items: types.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    type = newValue;
                                  });
                                }
                              },
                              //hint: const Text(''),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);

                    _alergiaApiService
                        .postAlegia(_title.text, type)
                        .then((success) {
                      if (success) {
                        scaffoldMessenger.showSnackBar(
                          const SnackBar(
                            content: Text('Se añadio el contenido con exito!'),
                          ),
                        );
                        context.pop();
                      } else {
                        scaffoldMessenger.showSnackBar(
                          const SnackBar(
                            content: Text('Falló la adición del contenido!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    });
                  },
                  child: Text(
                    'Añadir',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
