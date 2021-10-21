import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

import 'custom_image_button.dart';

class ImageContainerWidget extends StatelessWidget {
  final String title;
  final String poster;

  const ImageContainerWidget({
    Key key,
    @required this.title,
    @required this.poster,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            poster,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.5),
              primaryDarkPurple,
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImageButton(
                  contSize: 64,
                  image: "assets/eva_arrow-ios-back-fill.png",
                  opacity: 0.1,
                  imgSize: 40,
                  bgColor: primaryWhite.withOpacity(0.4),
                ),
              ),
              customText(
                text: title,
                fontSize: 34,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
