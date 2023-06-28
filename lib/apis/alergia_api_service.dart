import 'dart:convert';

import 'package:care_file_one/models/section_model/alergia_response_model.dart';
import 'package:care_file_one/models/section_model/alergias_response_model.dart';
import 'package:dio/dio.dart';

class AlergiaApiService {
  final Dio _dio = Dio();

  Future<AlergiaResponseModel> getAlergia(int alergiaId) async {
    final url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/alergia/$alergiaId';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJjb3JyZW8iOiJhMkBhLmNvbSIsImNvbnRyYXNlbmEiOiIyNDMyNjIyNDMxMzIyNDJlN2EzMjc1NTQ3NTQ1NDgzMjQ3MzE0OTRjNTc3NTYzMzE3MDMxNTg0ZjRmNjk2MzU3MzA0MzQ5MzE3NzY3NzA1NDRhNTU1Mzc1NTY0YTQzMzI2NjUxNjg1NzRmNjU1MTZhMzk1YTUxNjkifQ.maqosGPHMj42K4Oa2ik9BkSj322boTLLsGFol6hVV1w';

    try {
      final response =
          await _dio.get(url, options: Options(headers: {'token': token}));
      return AlergiaResponseModel.fromJson(response.data);
    } catch (error) {
      print("Error: $error AlergiaApiService");
      throw AssertionError('Error al obtener data of AlergiaApiService');
    }
  }

  Future<List<AlergiasResponseModel>> getAlergias() async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJjb3JyZW8iOiJhMkBhLmNvbSIsImNvbnRyYXNlbmEiOiIyNDMyNjIyNDMxMzIyNDJlN2EzMjc1NTQ3NTQ1NDgzMjQ3MzE0OTRjNTc3NTYzMzE3MDMxNTg0ZjRmNjk2MzU3MzA0MzQ5MzE3NzY3NzA1NDRhNTU1Mzc1NTY0YTQzMzI2NjUxNjg1NzRmNjU1MTZhMzk1YTUxNjkifQ.maqosGPHMj42K4Oa2ik9BkSj322boTLLsGFol6hVV1w';
    const userId = 1;
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
      print("Error: $error AlergiaApiService");
      throw AssertionError('Error al obtener data of AlergiaApiService');
    }
  }

  Future<bool> postAlegia(String title, String type) async {
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/alergia';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJjb3JyZW8iOiJhMkBhLmNvbSIsImNvbnRyYXNlbmEiOiIyNDMyNjIyNDMxMzIyNDJlN2EzMjc1NTQ3NTQ1NDgzMjQ3MzE0OTRjNTc3NTYzMzE3MDMxNTg0ZjRmNjk2MzU3MzA0MzQ5MzE3NzY3NzA1NDRhNTU1Mzc1NTY0YTQzMzI2NjUxNjg1NzRmNjU1MTZhMzk1YTUxNjkifQ.maqosGPHMj42K4Oa2ik9BkSj322boTLLsGFol6hVV1w';

    final body = jsonEncode({
      'user_id': 1,
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
      print('Error: $error AlergiaApiService');
      throw AssertionError('Error al postear datos AlergiaApiService');
    }
  }
}
