import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

class SecondContainer extends StatelessWidget {
  final String released;
  final String country;
  final String runtime;
  final String language;

  const SecondContainer({
    Key key,
    @required this.released,
    @required this.country,
    @required this.runtime,
    @required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 320,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                _customImage("assets/Group 357.png"),
                SizedBox(width: 16),
                customText(
                  text: released,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                _customImage("assets/Vector.png"),
                SizedBox(width: 16),
                customText(
                  text: country,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                _customImage("assets/Group 356.png"),
                SizedBox(width: 16),
                customText(
                  text: runtime,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _customImage("assets/Group 358.png"),
                SizedBox(width: 16),
                customText(
                  text: language,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Image _customImage(
    String image,
  ) {
    return Image.asset(
      image,
      height: 18,
      width: 18,
    );
  }
}
