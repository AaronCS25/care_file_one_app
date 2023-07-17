class CirugiaRequestModel {
  int userId; // id_usuario
  String cirugia; // titulo
  String type; // tipo

  CirugiaRequestModel({
    required this.userId,
    required this.cirugia,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id_usuario': userId,
      'titulo': cirugia,
      'tipo': type,
    };
    return data;
  }
}
