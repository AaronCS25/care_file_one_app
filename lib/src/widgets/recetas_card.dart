import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RecetasCard extends StatefulWidget {
  const RecetasCard(
      {super.key,
      required this.title,
      required this.date,
      required this.recetaId});

  final String title;
  final String date;
  final int recetaId;

  @override
  State<RecetasCard> createState() => _RecetasCardState();
}

class _RecetasCardState extends State<RecetasCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: const Color.fromRGBO(237, 237, 237, 1.0),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(20, 196, 123, 1.0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )),
              child: InkWell(
                onTap: () {
                  if (!_isTapped) {
                    _isTapped = true;
                    print(widget.recetaId);
                    context.push('/home/recetas/full/${widget.recetaId}');
                    _isTapped = false;
                  }
                },
                child: const Center(
                    child: Icon(
                  Icons.search,
                  size: 38,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
