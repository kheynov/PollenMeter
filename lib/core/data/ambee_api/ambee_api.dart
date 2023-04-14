import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pollen_meter/core/data/ambee_api/api_token.dart';
import 'package:pollen_meter/core/data/ambee_api/dto/pollen_dto.dart';
import 'package:pollen_meter/core/data/ambee_api/api_constants.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<PollenDTO> getPollenData(
      {required int latitude, required int longitude}) async {
    try {
      var res = await _dio.get(
          '${ApiConstants.baseURL}${ApiConstants.pollenEndpoint}?lat=$latitude&lng=$longitude',
          options: Options(headers: {'x-api-key': apiKey}));

      var data = res.data['data'][0];
      return PollenDTO.fromJson(data);
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
      rethrow;
    } catch (_, stacktrace) {
      debugPrint(stacktrace as String?);
      rethrow;
    }
  }
}
