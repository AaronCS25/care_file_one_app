class SignUpResponseModel {
  String description;
  int userId;
  String email;
  String password;

  SignUpResponseModel({
    required this.description,
    required this.userId,
    required this.email,
    required this.password,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
        description: json['description'],
        userId: json['user'][0],
        email: json['user'][1],
        password: json['user'][2]);
  }
}
