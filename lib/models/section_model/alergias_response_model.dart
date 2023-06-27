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

  static List<AlergiasResponseModel> parseList(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    return data
        .map<AlergiasResponseModel>(
          (item) => AlergiasResponseModel.fromJson(item),
        )
        .toList();
  }
}
