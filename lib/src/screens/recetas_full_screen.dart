import 'package:care_file_one/apis/receta_api_service.dart';
import 'package:care_file_one/models/recetas_model/receta_response_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RecetaFullScreen extends StatefulWidget {
  const RecetaFullScreen({super.key, required this.recetaId});

  final int recetaId;

  @override
  State<RecetaFullScreen> createState() => _RecetaFullScreenState();
}

class _RecetaFullScreenState extends State<RecetaFullScreen> {
  String nombrePaciente = '';
  String fecha = '';
  String medicamento = '';
  String instruccionesDeUso = '';
  String duracionDelTratamiento = '';
  String indicacionesAdicionales = '';
  String firmaDelMedico = '';
  String numeroDeLicencia = '';
  late String url;
  bool _isTapped = false;

  Future<void> fetchReceta() async {
    try {
      final RecetaApiService recetaApiService = RecetaApiService();
      final RecetaResponseModel recetaResponseModel =
          await recetaApiService.getReceta(widget.recetaId);
      setState(() {
        fecha = recetaResponseModel.date;
        medicamento = recetaResponseModel.medicamento;
        instruccionesDeUso = recetaResponseModel.instruccion;
        duracionDelTratamiento = recetaResponseModel.dias;
        indicacionesAdicionales = recetaResponseModel.extraInformation;
        firmaDelMedico = recetaResponseModel.firmaMedico;
        numeroDeLicencia = recetaResponseModel.numeroDeLicencia;
        url = recetaResponseModel.imgUrl;
      });
    } catch (error) {
      print('Error: $error Receta-FullScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchReceta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'RECETA #${widget.recetaId}',
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
                      header('Nombre del paciente'),
                      body(nombrePaciente),
                      header('Fecha'),
                      body(fecha),
                      header('Medicamento'),
                      body(medicamento),
                      header('Instrucciones de uso'),
                      body(instruccionesDeUso),
                      header('Duración del tratamiento'),
                      body(duracionDelTratamiento),
                      header('Indicaciones adicionales'),
                      body(indicacionesAdicionales),
                      header('Firma del médico'),
                      body(firmaDelMedico),
                      header('Número de licencia'),
                      body(numeroDeLicencia),
                      header('Especialidad'),
                      body('Medicina General'),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final encodeUrl = Uri.encodeComponent(url);
                              context.push(
                                  '/home/recetas/full/${widget.recetaId}/picture/$encodeUrl');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(93, 93, 93, 0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 56, vertical: 4),
                                child: Image.asset(
                                  'assets/images/picture.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(93, 93, 93, 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 56, vertical: 4),
                              child: Image.asset(
                                'assets/images/global.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(228, 4, 92, 1.0),
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
                            Icons.close,
                            size: 38,
                          )),
                        ),
                      )
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
