class PadecimientoResponseModel {
  int padecimientoId; // id_padecimiento
  String padecimiento; // titulo
  String type; // tipo
  String description; // descripcion
  String symptoms; // sintomas
  String tratamiento; // tratamiento

  PadecimientoResponseModel({
    required this.padecimientoId,
    required this.padecimiento,
    required this.type,
    required this.description,
    required this.symptoms,
    required this.tratamiento,
  });

  factory PadecimientoResponseModel.fromJson(Map<String, dynamic> json) {
    return PadecimientoResponseModel(
      padecimientoId: json['id_padecimiento'],
      padecimiento: json['titulo'],
      type: json['tipo'],
      description: json['descripcion'],
      symptoms: json['sintomas'],
      tratamiento: json['tratamiento'],
    );
  }
}

