import 'package:care_file_one/models/recetas_model/receta_request_model.dart';
import 'package:care_file_one/models/recetas_model/receta_response_model.dart';
import 'package:care_file_one/models/recetas_model/recetas_response_model.dart';
import 'package:care_file_one/services/auth_service.dart';
import 'package:dio/dio.dart';

class RecetaApiService {
  final Dio _dio = Dio();

  Future<RecetaResponseModel> getReceta(int recetaId) async {
    final url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/receta/$recetaId';
    final String token = await Auth.getToken();

    try {
      final response =
          await _dio.get(url, options: Options(headers: {'token': token}));
      return RecetaResponseModel.fromJson(response.data);
    } catch (error) {
      throw AssertionError('Error al obtener receta: $error');
    }
  }

  Future<List<RecetasResponseModel>> getRecetas() async {
    final String token = await Auth.getToken();
    final String userIdString = await Auth.getUserId();
    final int userId = int.parse(userIdString);

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
      throw AssertionError('Error al obtener data of RecetaApiService: $error');
    }
  }

  Future<bool> postReceta(RecetaRequestModel recetaRequestModel) async {
    const url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/receta';
    final String token = await Auth.getToken();

    final body = recetaRequestModel.toJson();

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
      throw AssertionError('Error al postear datos RecetaApiService: $error');
    }
  }
}
