class LoginResponseModel {
  String token;
  int userId;

  LoginResponseModel({required this.token, required this.userId});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token'], userId: json['user'][0]);
  }
}
