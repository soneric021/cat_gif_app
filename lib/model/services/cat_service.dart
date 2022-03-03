import 'dart:io';
import 'dart:convert';
import 'package:cat_gif_app/model/services/base_service.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../api/custom_exception.dart';

class CatService extends BaseService {
  final String _baseUrl = "https://cataas.com";
  
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      String finalurl = _baseUrl + url;
      final response = await http.get(Uri.parse(finalurl));
      print(response);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

  
}
