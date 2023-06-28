class RecetaRequestModel {
  String idUsuario;
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

  RecetaRequestModel({
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
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_usuario'] = idUsuario;
    data['descripcion'] = description;
    data['fecha_inicio'] = date;
    data['medicamento'] = medicamento;
    data['cantidad_medicamento'] = medicamentoCantidad;
    data['cantidad'] = cantidad;
    data['unidad'] = unidad;
    data['instruccion'] = instruccion;
    data['detalle_usuario'] = detalles;
    data['dosis'] = dosis;
    data['cada'] = cada;
    data['via'] = via;
    data['dias'] = dias;
    data['informacion_adicional'] = extraInformation;
    data['firma_medico'] = firmaMedico;
    data['numero_licencia'] = numeroDeLicencia;
    data['path_image'] = pathImage;
    return data;
  }
}
