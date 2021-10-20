import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  String text = "",
  double fontSize = 12,
  Color textColor = Colors.white,
  FontWeight fontWeight = FontWeight.normal,
  // double height = 1.2,
}) {
  return Text(
    text,
    style: GoogleFonts.montserrat(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      // height: height,
      
      
    ),
    // textWidthBasis: TextWidthBasis.parent,
    
  );
}
