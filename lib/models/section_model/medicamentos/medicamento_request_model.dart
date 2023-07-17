class MedicamentoRequestModel {
  int userId; // id_user
  String medicamento; // titulo
  String type; // tipo

  MedicamentoRequestModel({
    required this.userId,
    required this.medicamento,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = userId;
    data['titulo'] = medicamento;
    data['tipo'] = type;
    return data;
  }
}
