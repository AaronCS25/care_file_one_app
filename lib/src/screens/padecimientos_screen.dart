import 'package:care_file_one/src/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PadecimientosScreen extends StatefulWidget {
  const PadecimientosScreen({super.key});

  @override
  State<PadecimientosScreen> createState() => _PadecimientosScreenState();
}

class _PadecimientosScreenState extends State<PadecimientosScreen> {
  List<Map<String, String>> alergias = [
    {'title': 'Diabetes', 'type': 'tratado'},
    {'title': 'Artritis', 'type': 'no_tratado'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'PADECIMIENTOS',
          style: GoogleFonts.montserrat(
            fontSize: 16,
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
            section: 'padecimientos',
            cardId: 1,
          );
        },
      ),
    );
  }
}
