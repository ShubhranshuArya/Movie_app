import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';

class CustomImageButton extends StatelessWidget {
  double contSize;
  String image;
  double opacity;
  double imgSize;
  Color bgColor;

  CustomImageButton({
    @required this.contSize,
    @required this.image,
    @required this.opacity,
    @required this.imgSize,
    @required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: contSize,
      width: contSize,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(contSize * 0.4),
      ),
      child: Center(
        child: Image.asset(
          image,
          height: imgSize,
          width: imgSize,
        ),
      ),
    );
  }
}
