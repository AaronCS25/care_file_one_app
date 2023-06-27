import 'package:care_file_one/models/section_model/alergia_response_model.dart';
import 'package:care_file_one/models/section_model/alergias_response_model.dart';
import 'package:dio/dio.dart';

class AlergiaApiService {
  final Dio _dio = Dio();

  Future<AlergiaResponseModel> getAlergia(int alergiaId) async {
    final url =
        'https://ubqop7zg6f.execute-api.us-east-1.amazonaws.com/test/alergia/$alergiaId';
    const token = 'ss';

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
    const token = 'ss';
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
}
