class MedicamentosResponseModel {
  int idMedicamento; // id_medicacion
  String medicamento; // titulo
  String type; // tipo

  MedicamentosResponseModel({
    required this.idMedicamento,
    required this.medicamento,
    required this.type,
  });

  factory MedicamentosResponseModel.fromJson(Map<String, dynamic> json) {
    return MedicamentosResponseModel(
      idMedicamento: json['id_medicacion'],
      medicamento: json['titulo'],
      type: json['tipo'],
    );
  }

  static List<MedicamentosResponseModel> parseList(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    return data
        .map<MedicamentosResponseModel>(
          (item) => MedicamentosResponseModel.fromJson(item),
        )
        .toList();
  }
}