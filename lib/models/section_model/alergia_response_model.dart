class AlergiaResponseModel {
  int idAlergia;
  int idUsuario;
  String title;
  String type;
  String description;
  String sintomas;
  String treatment;

  AlergiaResponseModel({
    required this.idAlergia,
    required this.idUsuario,
    required this.title,
    required this.type,
    required this.description,
    required this.sintomas,
    required this.treatment,
  });

  factory AlergiaResponseModel.fromJson(Map<String, dynamic> json) {
    return AlergiaResponseModel(
      idAlergia: json['id_alergia'],
      idUsuario: json['id_usuario'],
      title: json['titulo'],
      type: json['tipo'],
      description: json['descripcion'],
      sintomas: json['sintomas'],
      treatment: json['tratamiento'],
    );
  }
}
