import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const AppIconButton(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40,
      this.iconSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Icon(icon,
            color: iconColor,
            size: iconSize == 0 ? Dimensions.iconSize16 : iconSize));
  }
}
