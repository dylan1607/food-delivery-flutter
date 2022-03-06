import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/constants.dart';
import 'package:food_delivery_flutter/controllers/popular_product_controller.dart';
import 'package:food_delivery_flutter/controllers/recommended_product_controller.dart';
import 'package:food_delivery_flutter/models/products_model.dart';
import 'package:food_delivery_flutter/routes/route_helper.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/icon_text.dart';
import 'package:food_delivery_flutter/widgets/small_text.dart';
import 'package:food_delivery_flutter/widgets/summary_food.dart';
import 'package:get/get.dart';
import 'package:food_delivery_flutter/screen/detail/popular_food.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // Define view scale next and previous slide visible  - viewportFraction
  PageController pageController =
      PageController(viewportFraction: 0.9, initialPage: 1);
  var _curPageValue = 0.0;
  final _height = Dimensions.pageViewContainer;
  final _scaleFactor = 0.8;

  // add override to change the state of the widget. Method is called when the widget is built
  // Initialize method
  // Listen event when page is changed. Using state management to save current index page
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageValue = pageController.page!;
      });
    });
  }

  // Leave page. Remove listener from memory. Keep memory clean, as small as possible
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section
        GetBuilder<PopularProductController>(builder: (items) {
          // check if loading is true or false
          return items.isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.mainColor,
                )
              : Container(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      // Add controller to pageView
                      controller: pageController,
                      itemCount: items.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, items.popularProductList[index]);
                      }),
                );
        }),
        // Indicate dot bottom
        GetBuilder<PopularProductController>(builder: (items) {
          return DotsIndicator(
            dotsCount: items.popularProductList.isEmpty
                ? 1
                : items.popularProductList.length,
            position: _curPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // Popular section
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              const BigText(text: "-", color: Colors.black26),
              SizedBox(width: Dimensions.width10),
              const SmallText(text: "Food Pairing", color: Colors.black26),
            ],
          ),
        ),
        // List Recommended food
        // height: 900,
        GetBuilder<RecommendedProductController>(builder: (items) {
          return items.isLoading
              ? const CircularProgressIndicator(color: AppColors.mainColor)
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.recommendedProductList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteHelper.getRecommendedPage(index)),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20,
                            vertical: Dimensions.height10),
                        child: Row(
                          children: [
                            // Image food. left side
                            Container(
                              height: Dimensions.listViewImageSize,
                              width: Dimensions.listViewImageSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  // Remember when network slowly, it will show color white
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          AppConstants.UPLOAD_URL +
                                              items
                                                  .recommendedProductList[index]
                                                  .img!),
                                      fit: BoxFit.cover)),
                            ),
                            // Content food. right side
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Title food
                                      BigText(
                                          text: items
                                              .recommendedProductList[index]
                                              .name),
                                      SizedBox(height: Dimensions.height10),
                                      // Description food
                                      SmallText(
                                          overFlow: TextOverflow.ellipsis,
                                          lines: 1,
                                          text: items
                                              .recommendedProductList[index]
                                              .description),
                                      SizedBox(height: Dimensions.height10),
                                      // Info food
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            IconText(
                                                icon: Icons.circle_sharp,
                                                text: "Normal",
                                                iconColor:
                                                    AppColors.iconColor1),
                                            IconText(
                                                icon: Icons.place,
                                                text: "3.7 km",
                                                iconColor: AppColors.mainColor),
                                            IconText(
                                                icon: Icons.access_time_rounded,
                                                text: "32 min",
                                                iconColor:
                                                    AppColors.iconColor2),
                                          ])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
        })
      ],
    );
  }

  // Build block item
  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // Animation scalling using api of flutter Matrix x,y coordinate axis
    Matrix4 matrix = Matrix4.identity();
    // Logic in here : current page round integer match index => scale up/down
    // Animate Y axis
    if (index == _curPageValue.floor()) {
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_curPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curPageValue.floor() - 1) {
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () => Get.toNamed(RouteHelper.getPopularPage(index)),
        child: Stack(
          children: [
            // Banner
            Container(
              height: Dimensions.pageViewContainer,
              // Spaces between items
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                  color: index.isEven
                      ? AppColors.blockColor1
                      : AppColors.blockColor2,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(
                          AppConstants.UPLOAD_URL + popularProduct.img!),
                      fit: BoxFit.cover)),
            ),

            // Content Block
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.pageViewTextContainer,
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: 15,
                    right: 15,
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width30,
                      vertical: Dimensions.height30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        // Shadow Bottom
                        BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 5,
                            offset: Offset(0, 6)),
                        // Remove shadow left and righ
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0))
                      ]),
                  child: SummaryFood(
                    title: popularProduct.name!,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
