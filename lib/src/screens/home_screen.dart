import 'dart:ui';

import 'package:care_file_one/apis/alergia_api_service.dart';
import 'package:care_file_one/models/section_model/alergias_response_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _names = 'Luis David';
  final String _lastNames = 'Mori Gucci';
  final String _address = 'Jr. Medrano Silva 165, Barranco';
  final String _phoneNumber = '946 416 969';
  final String _bloodType = 'a_plus';
  bool _isBlurredPadecimientos = true;
  bool _isBlurredCirugias = true;
  List<String> _allergies = [];
  final List<String> _padecimientos = ['Diabetes', 'Artritis'];
  final List<String> _medicacionActual = [
    'Paracetamol',
    'Acetaminofeno',
    'Amoxicilina'
  ];
  final List<String> _cirugias = ['Apendicectomia', 'LASK'];

  Future<void> fetchAlergias() async {
    try {
      final AlergiaApiService alergiaApiService = AlergiaApiService();
      final List<AlergiasResponseModel> alergias =
          await alergiaApiService.getAlergias();
      setState(() {
        _allergies = alergias.map((alergia) => alergia.title).toList();
      });
    } catch (error) {
      print('Error: $error Alergias-HomeScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlergias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'VISTA GENERAL',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 10),
            iconSize: 32,
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //* 1ra Parte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/type_of_blood_$_bloodType.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombres',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(93, 93, 93, 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                          child: Text(
                            _names,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Apellidos',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(93, 93, 93, 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                          child: Text(
                            _lastNames,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //* 2da Parte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Dirección del usuario',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                    child: Text(
                      _address,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Nro. de emergencias',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 6, 12),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/peru.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '+51 $_phoneNumber',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          //* 3ra Parte
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      //* ALERGIAS
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Alergias',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push('/home/alergias');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(93, 93, 93, 0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _allergies.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: RichText(
                                          text: TextSpan(
                                              text: '• ',
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: _allergies[index],
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 16),
                                                )
                                              ]),
                                        ));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        //* PADECIMIENTOS
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Padecimientos',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (!_isBlurredPadecimientos) {
                                context.push('/home/padecimientos');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(93, 93, 93, 0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _padecimientos.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: RichText(
                                            text: TextSpan(
                                                text: '• ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _padecimientos[index],
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 16),
                                                  )
                                                ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (_isBlurredPadecimientos)
                                    Positioned.fill(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                            color: Colors.black.withOpacity(0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: IconButton(
                                        icon: Icon(_isBlurredPadecimientos
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            _isBlurredPadecimientos =
                                                !_isBlurredPadecimientos;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      children: [
                        //* MEDICACIÓN ACTUAL
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Medicación actual',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push('/home/medicacion');
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(93, 93, 93, 0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _medicacionActual.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: RichText(
                                          text: TextSpan(
                                              text: '• ',
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      _medicacionActual[index],
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 16),
                                                )
                                              ]),
                                        ));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cirugias',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (!_isBlurredPadecimientos) {
                                context.push('/home/cirugias');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(93, 93, 93, 0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _cirugias.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: RichText(
                                            text: TextSpan(
                                                text: '• ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _cirugias[index],
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 16),
                                                  )
                                                ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (_isBlurredCirugias)
                                    Positioned.fill(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                            color: Colors.black.withOpacity(0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: IconButton(
                                        icon: Icon(_isBlurredCirugias
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            _isBlurredCirugias =
                                                !_isBlurredCirugias;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(20, 196, 123, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Icon(
                  Icons.assignment,
                  color: Color.fromRGBO(234, 234, 234, 1.0),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
