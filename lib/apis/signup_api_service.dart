import 'package:care_file_one/models/user_model/signup_request_model.dart';
import 'package:dio/dio.dart';

class SignUpApiService {
  final Dio _dio = Dio();

  SignUpApiService();

  Future<bool> signUpUser(SignUpRequestModel signUpRequestModel) async {
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/register';

    try {
      final response = await _dio.post(url, data: signUpRequestModel.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
