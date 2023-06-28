import 'package:care_file_one/src/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicacionScreen extends StatefulWidget {
  const MedicacionScreen({super.key});

  @override
  State<MedicacionScreen> createState() => _MedicacionScreenState();
}

class _MedicacionScreenState extends State<MedicacionScreen> {
  List<Map<String, String>> alergias = [
    {'title': 'Panadol', 'type': 'pildoras'},
    {'title': 'Calpol', 'type': 'jarabe'},
    {'title': 'Amoxil', 'type': 'pildoras'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'MEDICACIÓN ACTUAL',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 10),
            icon: Image.asset(
              'assets/icons/add_icon.png',
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: alergias.length,
        itemBuilder: (context, index) {
          return MainCard(
            title: alergias[index]['title']!,
            type: alergias[index]['type']!,
            section: 'medicacion',
            cardId: 1,
          );
        },
      ),
    );
  }
}
