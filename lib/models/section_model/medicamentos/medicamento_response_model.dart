class MedicamentoResponseModel {
  int idMedicamento; // id_medicacion
  String medicamento; // titulo
  String type; // tipo
  String description; // descripcion
  String indications; // indicaciones
  String modeOfUse; // modo_de_uso
  String precautions; // precauciones

  MedicamentoResponseModel({
    required this.idMedicamento,
    required this.medicamento,
    required this.type,
    required this.description,
    required this.indications,
    required this.modeOfUse,
    required this.precautions,
  });

  factory MedicamentoResponseModel.fromJson(Map<String, dynamic> json) {
    return MedicamentoResponseModel(
      idMedicamento: json['id_medicacion'],
      medicamento: json['titulo'],
      type: json['tipo'],
      description: json['descripcion'],
      indications: json['indicaciones'],
      modeOfUse: json['modo_de_uso'],
      precautions: json['precauciones'],
    );
  }
}
