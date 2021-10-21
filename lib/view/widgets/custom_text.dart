import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  String text = "",
  double fontSize = 12,
  Color textColor = Colors.white,
  FontWeight fontWeight = FontWeight.normal,
  TextAlign textAlign = TextAlign.center,
}) {
  return Text(
    text,
    style: GoogleFonts.montserrat(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign,
  );
}
