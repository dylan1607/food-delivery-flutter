import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/constants.dart';
import 'package:food_delivery_flutter/controllers/recommended_product_controller.dart';
import 'package:food_delivery_flutter/routes/route_helper.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/expandable_text.dart';
import 'package:food_delivery_flutter/widgets/icon_button.dart';
import 'package:get/get.dart';

class RecommendedFood extends StatelessWidget {
  final int id;
  const RecommendedFood({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
        Get.find<RecommendedProductController>().recommendedProductList[id];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // hide back button
            automaticallyImplyLeading: false,
            // Navigate icon with height
            toolbarHeight: Dimensions.heightToolbar,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() => Get.toNamed(RouteHelper.getHomePage())),
                  child: const AppIconButton(
                    icon: Icons.clear,
                  ),
                ),
                const AppIconButton(icon: Icons.shopping_cart_outlined)
              ],
            ),
            // Title Food on bottom Appbar
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10, bottom: Dimensions.height10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Center(
                    child: BigText(
                      text: product.name!,
                    ),
                  ),
                )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.heightScrollView,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                (AppConstants.UPLOAD_URL + product.img!),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: ExpandableText(
                  text: product.description!,
                ),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
          // Using minimum space
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ammount and Price
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 2.5,
                  vertical: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remove icon
                  AppIconButton(
                    icon: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  BigText(
                    text: "\$ ${product.price!} X 0 ",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  // Add icon
                  AppIconButton(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              ),
            ),
            // bottom function - favorite, add to cart
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width15,
                        vertical: Dimensions.height15),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: Colors.white),
                    child: Icon(Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimensions.iconSize24),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: const BigText(
                      text: '\$10 | Add to cart',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
