import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'VISTA GENERAL',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 32,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onPressed: () {},
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //* 1ra Parte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/type_of_blood_a_plus.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(93, 93, 93, 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                          child: Text(
                            'Aaron Arturo',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Apellidos',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(93, 93, 93, 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                          child: Text(
                            'Camacho Valencia',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //* 2da Parte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Dirección del usuario',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                    child: Text(
                      'Jr. Medrano Silva 165, Barranco',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Nro. de emergencias',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/peru.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '+51 946 416 969',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          //* 3ra Parte
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      //* ALERGIAS
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Alergias',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(93, 93, 93, 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        //* PADECIMIENTOS
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Padecimientos',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(93, 93, 93, 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      children: [
                        //* MEDICACIÓN ACTUAL
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Medicación actual',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(93, 93, 93, 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cirugias',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(93, 93, 93, 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(20, 196, 123, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Icon(
                  Icons.assignment,
                  color: Color.fromRGBO(234, 234, 234, 1.0),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
