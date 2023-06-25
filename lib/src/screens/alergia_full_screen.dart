import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlergiaFullScreen extends StatefulWidget {
  const AlergiaFullScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.sintomas,
      required this.treatment,
      required this.type});

  final String title;
  final String description;
  final List<String> sintomas;
  final String treatment;
  final String type;

  @override
  State<AlergiaFullScreen> createState() => _AlergiaFullScreenState();
}

class _AlergiaFullScreenState extends State<AlergiaFullScreen> {
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/alergias/${widget.type}.png',
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
                      header('Sintomas'),
                      textListBody(widget.sintomas),
                      header('Tratamiento en caso de emergencias'),
                      body(widget.description)
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
          fontSize: 16,
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
          fontSize: 16,
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
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
