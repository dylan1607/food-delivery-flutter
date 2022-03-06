import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';

class BigText extends StatelessWidget {
  // declare variable input value
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overFlow;
  const BigText(
      {Key? key,
      // default color value must be hexa code. Can't be variable
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overFlow,
        style: TextStyle(
          fontFamily: "Roboto",
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w400,
        ));
  }
}
