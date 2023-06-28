import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RecetaFullPictureScreen extends StatefulWidget {
  const RecetaFullPictureScreen({super.key, required this.url});

  final String url;

  @override
  State<RecetaFullPictureScreen> createState() =>
      _RecetaFullPictureScreenState();
}

class _RecetaFullPictureScreenState extends State<RecetaFullPictureScreen> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RECETA',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(widget.url),
                    ),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(170, 170, 170, 1.0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )),
                      child: InkWell(
                        onTap: () {
                          if (!_isTapped) {
                            _isTapped = true;
                            context.pop();
                            _isTapped = false;
                          }
                        },
                        child: const Center(
                            child: Icon(
                          Icons.arrow_back,
                          size: 38,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
