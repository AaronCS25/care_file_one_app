class MedicamentoRequestModel {
  int userId; // user_id
  String medicamento; // titulo
  String type; // tipo

  MedicamentoRequestModel({
    required this.userId,
    required this.medicamento,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['titulo'] = medicamento;
    data['tipo'] = type;
    return data;
  }
}
