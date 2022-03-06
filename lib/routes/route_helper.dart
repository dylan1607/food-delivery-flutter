import 'package:food_delivery_flutter/models/products_model.dart';
import 'package:food_delivery_flutter/screen/detail/popular_food.dart';
import 'package:food_delivery_flutter/screen/detail/recommended_food.dart';
import 'package:food_delivery_flutter/screen/home/home_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String homePage = "/";
  static const String popularPage = "/popular-food";
  static const String recommendedPage = "/recommended-food";

  static String getHomePage() => '$homePage';
  static String getPopularPage(int pageId) => '$popularPage?pageId=$pageId';
  static String getRecommendedPage(int id) => '$recommendedPage?id=$id';

  static List<GetPage> routes = [
    GetPage(
      transition: Transition.fadeIn,
      name: homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: popularPage,
      page: () {
        // get parameter from url
        var pageId = Get.parameters["pageId"];
        return PopularFood(pageId: int.parse(pageId!));
      },
    ),
    GetPage(
      name: recommendedPage,
      page: () {
        var id = Get.parameters["id"];
        return RecommendedFood(id: int.parse(id!));
      },
    ),
  ];
}
