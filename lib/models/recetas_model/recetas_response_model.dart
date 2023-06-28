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
}
