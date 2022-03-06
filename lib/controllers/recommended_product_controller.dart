import 'package:food_delivery_flutter/data/recommended_product_repo.dart';
import 'package:food_delivery_flutter/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  // private variable get data return from api
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getRecommendedProductList() async {
    Response res = await recommendedProductRepo.getRecommendedProductList();
    if (res.statusCode == 200) {
      // set null value to avoid data repeated
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(res.body).products);
      // update ui
      update();
      _isLoading = false;
    } else {}
  }
}
