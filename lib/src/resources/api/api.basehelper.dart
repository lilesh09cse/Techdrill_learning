import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api.exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    final header = {'Content-Type': 'application/json;charset=utf-8'};
    var responseJson;
    try {
      final response = await http.get(url, headers: header);
      responseJson = _returnResponse(response);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      return responseJson;
      break;
    case 201:
      var responseJson = json.decode(response.body);
      return responseJson;
      break;
    case 400:
      throw UnauthorizedException(response.body.toString());
      break;
    case 401:
      throw UnauthorizedException(response.body.toString());
      break;
    case 403:
      throw UnauthorizedExceptionknown(response.body.toString());
      break;
    case 500:
      throw InternalServerError(response.body.toString());
      break;
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
