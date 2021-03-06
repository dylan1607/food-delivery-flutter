import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/small_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize24,
      ),
      const SizedBox(width: 5),
      SmallText(text: text),
    ]);
  }
}
