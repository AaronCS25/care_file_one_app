import 'package:care_file_one/src/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CirugiasScreen extends StatefulWidget {
  const CirugiasScreen({super.key});

  @override
  State<CirugiasScreen> createState() => _CirugiasScreenState();
}

class _CirugiasScreenState extends State<CirugiasScreen> {
  List<Map<String, String>> alergias = [
    {'title': 'Apendicectomía', 'type': 'cirugia_abierta'},
    {'title': 'LASIK', 'type': 'cirugia_laser'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'CIRUGÍAS',
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
            section: 'cirugias',
            cardId: 1,
          );
        },
      ),
    );
  }
}
