class PadecimientoRequestModel {
  int userId; // id_user
  String padecimiento; // titulo
  String type; // tipo

  PadecimientoRequestModel({
    required this.userId,
    required this.padecimiento,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id_user': userId,
      'titulo': padecimiento,
      'tipo': type,
    };
    return data;
  }
}
