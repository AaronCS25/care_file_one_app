import 'package:care_file_one/src/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:care_file_one/apis/alergia_api_service.dart';
import 'package:care_file_one/models/section_model/alergias_response_model.dart';

class AlergiasScreen extends StatefulWidget {
  const AlergiasScreen({super.key});

  @override
  State<AlergiasScreen> createState() => _AlergiasScreenState();
}

class _AlergiasScreenState extends State<AlergiasScreen> {
  List<Map<String, dynamic>> _alergias = [];

  Future<void> fetchAlergias() async {
    try {
      final AlergiaApiService alergiaApiService = AlergiaApiService();
      final List<AlergiasResponseModel> alergias =
          await alergiaApiService.getAlergias();
      setState(() {
        _alergias = alergias
            .map((alergia) => {
                  'title': alergia.title,
                  'type': 'animal',
                  'alergiaId': alergia.idAlergia
                })
            .toList();
      });
      print(_alergias);
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
          'ALERGIAS',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.push('/home/alergias/add');
            },
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
        itemCount: _alergias.length,
        itemBuilder: (context, index) {
          return MainCard(
            title: _alergias[index]['title'],
            type: _alergias[index]['type'],
            section: 'alergias',
            cardId: _alergias[index]['alergiaId'],
          );
        },
      ),
    );
  }
}
