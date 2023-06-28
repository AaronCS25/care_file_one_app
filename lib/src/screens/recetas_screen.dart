import 'package:care_file_one/apis/receta_api_service.dart';
import 'package:care_file_one/models/recetas_model/recetas_response_model.dart';
import 'package:care_file_one/src/widgets/recetas_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RecetasScreen extends StatefulWidget {
  const RecetasScreen({super.key});

  @override
  State<RecetasScreen> createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {
  List<Map<String, dynamic>> _recetas = [];

  Future<void> fetchRecetas() async {
    try {
      final RecetaApiService recetaApiService = RecetaApiService();
      final List<RecetasResponseModel> recetas =
          await recetaApiService.getRecetas();
      setState(() {
        _recetas = recetas
            .map((receta) => {
                  'title': receta.description,
                  'fecha': receta.date,
                  'recetaId': receta.idReceta,
                })
            .toList();
      });
      print(_recetas);
    } catch (error) {
      print('Error: $error Alergias-HomeScreen');
    }
  }

  String currentDate = '';

  @override
  void initState() {
    super.initState();
    fetchRecetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RECETAS',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.push('/home/recetas/add');
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
        itemCount: _recetas.length,
        itemBuilder: (context, index) {
          final currentFecha = _recetas[index]['fecha']!;
          if (currentDate != currentFecha) {
            currentDate = currentFecha;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Text(currentDate,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.grey,
                          )),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                      )
                    ],
                  ),
                ),
                RecetasCard(
                  title: _recetas[index]['title']!,
                  date: _recetas[index]['fecha']!,
                  recetaId: _recetas[index]['recetaId'],
                ),
              ],
            );
          } else {
            return RecetasCard(
              title: _recetas[index]['title']!,
              date: _recetas[index]['fecha']!,
              recetaId: _recetas[index]['recetaId'],
            );
          }
        },
      ),
    );
  }
}
