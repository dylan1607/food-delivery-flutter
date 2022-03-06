import 'package:food_delivery_flutter/constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  // Map key pair value <Key, Value>
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    // Header for get request api include authentication
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getMethod(
    String uri,
  ) async {
    try {
      Response res = await get(uri);
      return res;
    } catch (err) {
      return Response(statusCode: 1, statusText: err.toString());
    }
  }
}
