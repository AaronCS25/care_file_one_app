class CirugiasResponseModel {
  int cirugiaId; // id_cirugia
  String cirugias; // titulo
  String type; // tipo

  CirugiasResponseModel({
    required this.cirugiaId,
    required this.cirugias,
    required this.type,
  });

  factory CirugiasResponseModel.fromJson(Map<String, dynamic> json) {
    return CirugiasResponseModel(
      cirugiaId: json['id_cirugia'],
      cirugias: json['titulo'],
      type: json['tipo'],
    );
  }

  static List<CirugiasResponseModel> parseList(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    return data
        .map<CirugiasResponseModel>(
            (item) => CirugiasResponseModel.fromJson(item))
        .toList();
  }
}
