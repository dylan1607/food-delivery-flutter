import 'package:food_delivery_flutter/data/popular_product_repo.dart';
import 'package:food_delivery_flutter/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  // private variable get data return from api
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getPopularProductList() async {
    Response res = await popularProductRepo.getPopularProductList();
    if (res.statusCode == 200) {
      // set null value to avoid data repeated
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(res.body).products);
      // update ui
      update();
      _isLoading = false;
    } else {}
  }
}
