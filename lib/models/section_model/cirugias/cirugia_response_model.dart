class CirugiaResponseModel {
  int cirugiaId; // id_cirugia
  String cirugia; // titulo
  String type; // tipo
  String description; // descripcion
  String recovery; // recuperacion
  String recommendations; // recomendaciones

  CirugiaResponseModel({
    required this.cirugiaId,
    required this.cirugia,
    required this.type,
    required this.description,
    required this.recovery,
    required this.recommendations,
  });

  factory CirugiaResponseModel.fromJson(Map<String, dynamic> json) {
    return CirugiaResponseModel(
      cirugiaId: json['id_cirugia'],
      cirugia: json['titulo'],
      type: json['tipo'],
      description: json['descripcion'],
      recovery: json['recuperacion'],
      recommendations: json['recomendaciones'],
    );
  }
}
