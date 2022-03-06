import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/constants.dart';
import 'package:food_delivery_flutter/controllers/popular_product_controller.dart';
import 'package:food_delivery_flutter/routes/route_helper.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/expandable_text.dart';
import 'package:food_delivery_flutter/widgets/icon_button.dart';
import 'package:food_delivery_flutter/widgets/summary_food.dart';
import 'package:get/get.dart';

class PopularFood extends StatelessWidget {
  final int pageId;
  const PopularFood({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image Background Food
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.imageDetailPage,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(AppConstants.UPLOAD_URL + product.img!),
                      fit: BoxFit.cover)),
            ),
          ),
          // Navigation icon button - BACK - CART
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      Get.toNamed(RouteHelper.getHomePage());
                    },
                    child: const AppIconButton(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  const AppIconButton(icon: Icons.shopping_cart_outlined)
                ],
              )),
          // Introduction Food
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.imageDetailPage - Dimensions.height20,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SummaryFood(
                        title: product.name,
                      ),
                      SizedBox(height: Dimensions.height20),
                      const BigText(text: "Introduce"),
                      SizedBox(height: Dimensions.height10),
                      // Text description
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                            text: product.description!,
                          ),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
      // Build Bottom Function
      bottomNavigationBar: Container(
        height: Dimensions.heightContainer,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20)),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ammount items
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.width10 / 2),
                  const BigText(text: '0'),
                  SizedBox(width: Dimensions.width10 / 2),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            // Add to cart button
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: '\$ ${product.price!} | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
