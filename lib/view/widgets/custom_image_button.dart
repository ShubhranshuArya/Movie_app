import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final double contSize;
  final String image;
  final double opacity;
  final double imgSize;
  final Color bgColor;

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
