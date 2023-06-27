import 'package:care_file_one/models/user_model/login_request_model.dart';
import 'package:dio/dio.dart';

class LoginApiService {
  final Dio _dio = Dio();

  LoginApiService();

  Future<bool> loginUser(LoginRequestModel loginRequestModel) async {
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/login';
    try {
      final response = await _dio.post(url, data: loginRequestModel.toJson());
      if (response.statusCode == 200) {
        print("Al ok");
        return true;
      } else {
        print("No: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("No: ${e}");
      return false;
    }
  }
}
