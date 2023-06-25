import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlergiaCard extends StatefulWidget {
  const AlergiaCard({super.key, required this.title, required this.type});

  final String title;
  final String type;

  @override
  State<AlergiaCard> createState() => _AlergiaCardState();
}

class _AlergiaCardState extends State<AlergiaCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          if (!_isTapped) {
            _isTapped = true;
            print('Tap on : ${widget.title}');
            // navegación
            _isTapped = false;
          }
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: const Color.fromRGBO(237, 237, 237, 1.0),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/alergias/${widget.type}.png',
                    width: 50,
                    height: 50,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
