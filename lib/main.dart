import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/controllers/popular_product_controller.dart';
import 'package:food_delivery_flutter/controllers/recommended_product_controller.dart';
import 'package:food_delivery_flutter/routes/route_helper.dart';
import 'package:food_delivery_flutter/screen/detail/popular_food.dart';
import 'package:food_delivery_flutter/screen/detail/recommended_food.dart';
import 'package:food_delivery_flutter/screen/home/home_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dependencies;

Future<void> main() async {
  // This widget make sure that the dependencies are loaded before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  // Find and load all dependencies
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // Route configuration
      initialRoute: RouteHelper.homePage,
      getPages: RouteHelper.routes,
    );
  }
}
