class CirugiaRequestModel {
  int userId; // user_id
  String cirugia; // titulo
  String type; // tipo

  CirugiaRequestModel({
    required this.userId,
    required this.cirugia,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'user_id': userId,
      'titulo': cirugia,
      'tipo': type,
    };
    return data;
  }
}
