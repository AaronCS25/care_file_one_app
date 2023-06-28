import 'package:care_file_one/models/section_model/alergia_response_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:care_file_one/apis/alergia_api_service.dart';

class AlergiaFullScreen extends StatefulWidget {
  const AlergiaFullScreen({super.key, required this.alergiaId});

  final int alergiaId;

  @override
  State<AlergiaFullScreen> createState() => _AlergiaFullScreenState();
}

class _AlergiaFullScreenState extends State<AlergiaFullScreen> {
  String title = '';
  String description = '';
  List<String> sintomas = [];
  String treatment = '';
  String type = 'animal';

  Future<void> fetchAlergia() async {
    try {
      final AlergiaApiService alergiaApiService = AlergiaApiService();
      final AlergiaResponseModel alergiaResponseModel =
          await alergiaApiService.getAlergia(widget.alergiaId);
      setState(() {
        title = alergiaResponseModel.title;
        description = alergiaResponseModel.description;
        treatment = alergiaResponseModel.treatment;
        //type = alergiaResponseModel.type;
      });
    } catch (error) {
      throw AssertionError('Error: $error Alergias-FullScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlergia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/alergias/$type.png',
                  width: 50,
                  height: 50,
                )
              ],
            )),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
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
                      body(description),
                      header('Sintomas'),
                      textListBody(sintomas),
                      header('Tratamiento en caso de emergencias'),
                      body(treatment)
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
