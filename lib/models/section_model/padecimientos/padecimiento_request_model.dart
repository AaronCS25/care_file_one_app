class PadecimientoRequestModel {
  int userId; // user_id
  String padecimiento; // titulo
  String type; // tipo

  PadecimientoRequestModel({
    required this.userId,
    required this.padecimiento,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'user_id': userId,
      'titulo': padecimiento,
      'tipo': type,
    };
    return data;
  }
}
