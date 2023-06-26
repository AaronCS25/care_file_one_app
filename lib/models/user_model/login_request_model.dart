class LoginRequestModel {
  String dni;
  String password;

  LoginRequestModel({required this.dni, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['correo'] = dni;
    data['contrasena'] = password;
    return data;
  }
}
