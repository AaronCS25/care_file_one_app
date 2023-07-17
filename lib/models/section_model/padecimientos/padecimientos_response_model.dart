class PadecimientosResponseModel {
  int padecimientoId; // id_padecimiento
  String padecimiento; // titulo
  String type; // tipo

  PadecimientosResponseModel({
    required this.padecimientoId,
    required this.padecimiento,
    required this.type,
  });

  factory PadecimientosResponseModel.fromJson(Map<String, dynamic> json) {
    return PadecimientosResponseModel(
      padecimientoId: json['id_padecimiento'],
      padecimiento: json['titulo'],
      type: json['tipo'],
    );
  }

  static List<PadecimientosResponseModel> parseList(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    return data
        .map<PadecimientosResponseModel>(
          (item) => PadecimientosResponseModel.fromJson(item),
        )
        .toList();
  }
}
