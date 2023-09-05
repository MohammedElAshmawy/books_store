import 'package:book_store/Core/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: "ShadowsIntoLight",

  );
  static final textStyleNormal20 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static final textStyleSmall = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static final textStyleNormal16 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    fontFamily: gtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

const TextStyle textStyle = TextStyle();