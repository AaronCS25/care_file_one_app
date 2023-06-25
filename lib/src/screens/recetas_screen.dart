import 'package:care_file_one/src/widgets/recetas_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecetasScreen extends StatefulWidget {
  const RecetasScreen({super.key});

  @override
  State<RecetasScreen> createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {
  List<Map<String, String>> recetas = [
    {
      'title': 'Recéta médica de paracetamos para alivio del Dolor',
      'fecha': '18.05.2023'
    },
    {
      'title': 'Recéta médica para Sumatriptán en el tratamiento de la migraña',
      'fecha': '18.05.2023'
    },
    {
      'title':
          'Recéta médica para ibuprofeno en el tratamiento del dolor muscular',
      'fecha': '12.04.2023'
    },
    {
      'title': 'Recéta médica para Metformina en el tratamiento de la diabetes',
      'fecha': '25.09.2002'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'RECETAS',
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
        itemCount: recetas.length,
        itemBuilder: (context, index) {
          return RecetasCard(
              title: recetas[index]['title']!,
              date: recetas[index]['fecha']!,
              recetaId: 5);
        },
      ),
    );
  }
}
