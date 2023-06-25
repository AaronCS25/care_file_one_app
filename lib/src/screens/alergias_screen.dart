import 'package:care_file_one/src/widgets/alergia_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlergiasScreen extends StatefulWidget {
  const AlergiasScreen({super.key});

  @override
  State<AlergiasScreen> createState() => _AlergiasScreenState();
}

class _AlergiasScreenState extends State<AlergiasScreen> {
  List<Map<String, String>> alergias = [
    {'title': 'Penicilina', 'type': 'medica'},
    {'title': 'Antiinflamatorios', 'type': 'medica'},
    {'title': 'Polen', 'type': 'ambiental'},
    {'title': 'Mariscos', 'type': 'alimenticia'},
    {'title': 'Apis Melifera', 'type': 'animal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ALERGIAS',
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
          return AlergiaCard(
              title: alergias[index]['title']!, type: alergias[index]['type']!);
        },
      ),
    );
  }
}
