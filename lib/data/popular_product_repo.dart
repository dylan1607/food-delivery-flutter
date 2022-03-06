import 'package:food_delivery_flutter/api/client.dart';
import 'package:food_delivery_flutter/constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getMethod(AppConstants.POPULAR_PRODUCT_URI);
  }
}
