import 'package:care_file_one/models/recetas_model/receta_response_model.dart';
import 'package:care_file_one/models/recetas_model/recetas_response_model.dart';
import 'package:dio/dio.dart';

class RecetaApiService {
  final Dio _dio = Dio();

  Future<RecetaResponseModel> getReceta(int recetaId) async {
    final url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/receta/$recetaId';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJjb3JyZW8iOiJhMkBhLmNvbSIsImNvbnRyYXNlbmEiOiIyNDMyNjIyNDMxMzIyNDJlN2EzMjc1NTQ3NTQ1NDgzMjQ3MzE0OTRjNTc3NTYzMzE3MDMxNTg0ZjRmNjk2MzU3MzA0MzQ5MzE3NzY3NzA1NDRhNTU1Mzc1NTY0YTQzMzI2NjUxNjg1NzRmNjU1MTZhMzk1YTUxNjkifQ.maqosGPHMj42K4Oa2ik9BkSj322boTLLsGFol6hVV1w';

    try {
      final response =
          await _dio.get(url, options: Options(headers: {'token': token}));
      return RecetaResponseModel.fromJson(response.data);
    } catch (error) {
      print("Error: $error AlergiaApiService");
      throw AssertionError('Error al obtener data of AlergiaApiService');
    }
  }

  Future<List<RecetasResponseModel>> getRecetas() async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJjb3JyZW8iOiJhMkBhLmNvbSIsImNvbnRyYXNlbmEiOiIyNDMyNjIyNDMxMzIyNDJlN2EzMjc1NTQ3NTQ1NDgzMjQ3MzE0OTRjNTc3NTYzMzE3MDMxNTg0ZjRmNjk2MzU3MzA0MzQ5MzE3NzY3NzA1NDRhNTU1Mzc1NTY0YTQzMzI2NjUxNjg1NzRmNjU1MTZhMzk1YTUxNjkifQ.maqosGPHMj42K4Oa2ik9BkSj322boTLLsGFol6hVV1w';
    const userId = 1;
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/receta';

    try {
      final response = await _dio.get(
        url,
        queryParameters: {'user_id': userId},
        options: Options(headers: {'token': token}),
      );

      final List<RecetasResponseModel> recetas =
          RecetasResponseModel.parseList(response.data);
      return recetas;
    } catch (error) {
      print("Error: $error RecetaApiService");
      throw AssertionError('Error al obtener data of RecetaApiService');
    }
  }
}
