import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

class ThirdContainer extends StatelessWidget {
  final String plot;

  const ThirdContainer({
    Key key,
    this.plot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      width: 320,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(text: "Plot", fontSize: 24),
            SizedBox(height: 12),
            customText(
              text: "\"$plot\"",
              fontSize: 20,
              textColor: primaryWhite.withOpacity(0.6),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
