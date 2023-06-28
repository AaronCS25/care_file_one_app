import 'dart:convert';

import 'package:care_file_one/models/section_model/alergia_response_model.dart';
import 'package:care_file_one/models/section_model/alergias_response_model.dart';
import 'package:care_file_one/services/auth_service.dart';
import 'package:dio/dio.dart';

class AlergiaApiService {
  final Dio _dio = Dio();

  Future<AlergiaResponseModel> getAlergia(int alergiaId) async {
    final url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/alergia/$alergiaId';
    final String token = await Auth.getToken();

    try {
      final response =
          await _dio.get(url, options: Options(headers: {'token': token}));
      return AlergiaResponseModel.fromJson(response.data);
    } catch (error) {
      throw AssertionError('Error al obtener data of AlergiaApiService');
    }
  }

  Future<List<AlergiasResponseModel>> getAlergias() async {
    final String token = await Auth.getToken();
    final String userIdString = await Auth.getUserId();
    final int userId = int.parse(userIdString);
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/alergia/';

    try {
      final response = await _dio.get(
        url,
        queryParameters: {'user_id': userId},
        options: Options(headers: {'token': token}),
      );

      final List<AlergiasResponseModel> alergias =
          AlergiasResponseModel.parseList(response.data);
      return alergias;
    } catch (error) {
      throw AssertionError('Error al obtener data of AlergiaApiService');
    }
  }

  Future<bool> postAlegia(String title, String type) async {
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/alergia';
    final String token = await Auth.getToken();
    final String userIdString = await Auth.getUserId();
    final int userId = int.parse(userIdString);

    final body = jsonEncode({
      'user_id': userId,
      'titulo': title,
      'tipo': type,
      'language_code': 'es-Mx',
    });

    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: {'token': token}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw AssertionError('Error al postear datos AlergiaApiService');
    }
  }
}
