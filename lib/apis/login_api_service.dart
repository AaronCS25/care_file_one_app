import 'package:care_file_one/models/user_model/login_request_model.dart';
import 'package:care_file_one/models/user_model/login_response_model.dart';
import 'package:care_file_one/services/auth_service.dart';
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
        final LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(response.data);
        await Auth.saveToken(loginResponseModel.token);
        await Auth.saveUserId('${loginResponseModel.userId}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw AssertionError('Error loginUser: $e');
    }
  }
}
