class SignUpRequestModel {
  String email;
  String name;
  String password;

  SignUpRequestModel(
      {required this.email, required this.name, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['correo'] = email;
    data['nombre'] = name;
    data['contrasena'] = password;
    return data;
  }
}
