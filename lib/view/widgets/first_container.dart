import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

class FirstContainer extends StatelessWidget {
  
  final String imdbRating;
  final String rottenTomatoes;
  final String metaCritic;

  const FirstContainer({
    Key key,
    
    @required this.imdbRating,
    @required this.rottenTomatoes,
    @required this.metaCritic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _starImage(),
                    _starImage(),
                    _starImage(),
                    _starImage(),
                  ],
                ),
                customText(
                  text: imdbRating,
                  fontSize: 20,
                  textColor: primaryYellow,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: "Internet Movie\nDatabase",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
                customText(
                  text: "$imdbRating/10",
                  fontSize: 20,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Rotten Tomatoes",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
                customText(
                  text: rottenTomatoes,
                  fontSize: 20,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Metacritic",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: primaryWhite.withOpacity(0.6),
                ),
                customText(
                  text: metaCritic,
                  fontSize: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Image _starImage() {
    return Image.asset(
      "assets/Star 1.png",
      height: 18,
      width: 18,
    );
  }
}
