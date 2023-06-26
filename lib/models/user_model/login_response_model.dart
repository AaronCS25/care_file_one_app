class LoginResponseModel {
  int statusCode;
  String token;
  int userId;

  LoginResponseModel(
      {required this.statusCode, required this.token, required this.userId});

  factory LoginResponseModel.fromJson(
      int statusCode, Map<String, dynamic> json) {
    return LoginResponseModel(
        statusCode: statusCode, token: json['token'], userId: json['user'][0]);
  }
}
