import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  // declare variable input value
  final Color? color;
  final String text;
  final double size;
  final double height;
  final TextOverflow? overFlow;
  final int? lines;
  const SmallText(
      {Key? key,
      // default color value must be hexa code. Can't be variable
      this.color = const Color(0xFFCCC7C5),
      required this.text,
      this.size = 12,
      this.overFlow,
      this.lines,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: lines,
        overflow: overFlow,
        style: TextStyle(
          fontFamily: "Roboto",
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,
          height: height,
        ));
  }
}
