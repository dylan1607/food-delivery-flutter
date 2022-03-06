import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/constants.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/icon_text.dart';
import 'package:food_delivery_flutter/widgets/small_text.dart';

class SummaryFood extends StatelessWidget {
  final String title;
  final String rating;
  final String comments;
  const SummaryFood({
    Key? key,
    required this.title,
    this.rating = '5',
    this.comments = '1234',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        BigText(text: title, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            // Add logic in here to show data return from API
            // Draw rating star.
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(Icons.star,
                      color: AppColors.mainColor, size: 15)),
            ),
            const SizedBox(width: 10),
            // Show number of rating
            SmallText(text: rating),
            const SizedBox(width: 10),
            // Show number of review
            SmallText(text: comments),
            const SizedBox(width: 10),
            const SmallText(text: "comments")
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          IconText(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1),
          IconText(
              icon: Icons.place,
              text: "3.7 km",
              iconColor: AppColors.mainColor),
          IconText(
              icon: Icons.access_time_rounded,
              text: "32 min",
              iconColor: AppColors.iconColor2),
        ])
      ],
    );
  }
}
