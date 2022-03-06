import 'package:food_delivery_flutter/api/client.dart';
import 'package:food_delivery_flutter/constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getMethod(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
