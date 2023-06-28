import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicacionFullScreen extends StatefulWidget {
  const MedicacionFullScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.recovery,
      required this.recommendations,
      required this.type});

  final String title;
  final String description;
  final String recovery;
  final List<String> recommendations;
  final String type;

  @override
  State<MedicacionFullScreen> createState() => _MedicacionFullScreenState();
}

class _MedicacionFullScreenState extends State<MedicacionFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/cirugias/${widget.type}.png',
                  width: 50,
                  height: 50,
                )
              ],
            )),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header('Descripción'),
                      body(widget.description),
                      header('Recuperación'),
                      body(widget.recovery),
                      header('Recomendaciones:'),
                      textListBody(widget.recommendations)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Padding header(String header) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 2),
      child: Text(
        '$header:',
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding body(String textBody) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        textBody,
        style: GoogleFonts.montserrat(
          fontSize: 14,
        ),
      ),
    );
  }

  ListView textListBody(List<String> listBody) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listBody.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            '• ${listBody[index]}',
            style: GoogleFonts.montserrat(
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
