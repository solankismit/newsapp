import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:newsapp/ui/common/app_style.dart';

const kwidgetBGLight = Color(0xffF5F5F5);
const kbackgroundLight = Color(0xffffffff);
// const kbackgroundLight = Color(0xffe20000);
//Add Heading Style
TextStyle fontStyle(double size, Color color, FontWeight fontWeight) {
  return GoogleFonts.varelaRound(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
    wordSpacing: 0
  );
}