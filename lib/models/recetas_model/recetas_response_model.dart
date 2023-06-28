class RecetasResponseModel {
  int idReceta;
  int idUsuario;
  String description;
  String date;

  RecetasResponseModel({
    required this.idReceta,
    required this.idUsuario,
    required this.description,
    required this.date,
  });

  factory RecetasResponseModel.fromJson(Map<String, dynamic> json) {
    return RecetasResponseModel(
      idReceta: json['id_receta'],
      idUsuario: json['id_usuario'],
      description: json['descripcion'],
      date: json['fecha_inicio'],
    );
  }

  static List<RecetasResponseModel> parseList(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    return data
        .map<RecetasResponseModel>(
          (item) => RecetasResponseModel.fromJson(item),
        )
        .toList();
  }
}
