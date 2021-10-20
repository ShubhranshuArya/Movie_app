import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

class ThirdContainer extends StatelessWidget {
  final String plot;
  final String directors;
  final String actors;
  final String writers;

  const ThirdContainer({
    Key key,
    this.plot,
    this.directors,
    this.actors,
    this.writers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720,
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
            ),
            SizedBox(height: 32),
            customText(text: "Director", fontSize: 24),
            SizedBox(height: 12),
            _nameContainer(name: directors),
            SizedBox(height: 32),
            customText(text: "Actors", fontSize: 24),
            SizedBox(height: 12),
            _nameContainer(name: "Chris Pratt"),
            SizedBox(height: 12),
            _nameContainer(name: "Joe Saldana"),
            SizedBox(height: 32),
            customText(text: "Writers", fontSize: 24),
            SizedBox(height: 12),
            _nameContainer(name: "James Gunn"),
            SizedBox(height: 12),
            _nameContainer(name: "Andy Lanning"),
          ],
        ),
      ),
    );
  }
}

Widget _nameContainer({
  String name = "",
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: 180,
      minWidth: 120,
    ),
    child: Container(
      height: 40,
      decoration: BoxDecoration(
        color: primaryWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: customText(
            text: name, textColor: primaryWhite.withOpacity(0.4), fontSize: 16),
      ),
    ),
  );
}
