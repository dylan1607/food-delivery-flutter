import 'package:get/get.dart';

// Dimension iphone 12 Pro : 390 x 844
// Dynamic Dimension Another Screen
class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.6;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // Dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  // Dynamic height padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  // Font Size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;
  static double heightFont = screenHeight / 562.67; //1.5

  // Raidus - 844/value
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // Icon Size - 844/value
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;

  // List view size
  static double listViewImageSize = screenWidth / 3.25; // 120px
  static double listViewTextSize = screenWidth / 3.9; // 100px

  // Image Detail PAge
  static double imageDetailPage = screenHeight / 2.41; //844/350

  // Height container
  static double heightContainer = screenHeight / 7.03; //120
  static double heightScrollView = screenHeight / 2.81;
  static double heightToolbar = screenHeight / 12.06;
}
