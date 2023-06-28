class RecetaGetResponseModel {
  int idReceta;
  int idUsuario;
  String date;
  String medicamento;
  String medicamentoCantidad;
  String unidad;
  String instruccion;
  String detalles;
  String dosis;
  String cada;
  String via;
  String dias;
  String cantidad;
  String extraInformation;
  String firmaMedico;
  String numeroDeLicencia;
  String pathImage;
  String description;
  String imgUrl;

  RecetaGetResponseModel({
    required this.idReceta,
    required this.idUsuario,
    required this.date,
    required this.medicamento,
    required this.medicamentoCantidad,
    required this.unidad,
    required this.instruccion,
    required this.detalles,
    required this.dosis,
    required this.cada,
    required this.via,
    required this.dias,
    required this.cantidad,
    required this.extraInformation,
    required this.firmaMedico,
    required this.numeroDeLicencia,
    required this.pathImage,
    required this.description,
    required this.imgUrl,
  });

  factory RecetaGetResponseModel.fromJson(Map<String, dynamic> json) {
    return RecetaGetResponseModel(
      idReceta: json["id_receta"],
      idUsuario: json['id_usuario'],
      date: json['fecha_inicio'],
      medicamento: json['medicamento'],
      medicamentoCantidad: json['cantidad_medicamento'],
      unidad: json['unidad'],
      instruccion: json['instruccion'],
      detalles: json['detalle_usuario'],
      dosis: json['dosis'],
      cada: json['cada'],
      via: json['via'],
      dias: json['dias'],
      cantidad: json['cantidad'],
      extraInformation: json['informacion_adicional'],
      firmaMedico: json['firma_medico'],
      numeroDeLicencia: json['numero_licencia'],
      pathImage: json['path_image'],
      description: json['descripcion'],
      imgUrl: json['presigned_url'],
    );
  }
}
