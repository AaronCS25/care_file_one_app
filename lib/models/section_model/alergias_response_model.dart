import 'dart:convert';

class AlergiasResponseModel {
  int idAlergia;
  int idUsuario;
  String title;
  String type;

  AlergiasResponseModel({
    required this.idAlergia,
    required this.idUsuario,
    required this.title,
    required this.type,
  });

  factory AlergiasResponseModel.fromJson(Map<String, dynamic> json) {
    return AlergiasResponseModel(
      idAlergia: json['id_alergia'],
      idUsuario: json['id_usuario'],
      title: json['titulo'],
      type: json['tipo'],
    );
  }

  static List<AlergiasResponseModel> parseList(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
    return parsed
        .map<AlergiasResponseModel>(
            (json) => AlergiasResponseModel.fromJson(json))
        .toList();
  }
}
