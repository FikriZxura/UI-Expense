import 'package:flutter/material.dart';

final Color appViolet = Color(0xff7F3DFF);
final Color appVioletSoft = Color(0xffEEE5FF);
final Color appGrey = Color(0xff91919F);
final Color appBlack = Color(0xff161719);
final Color appBlack70 = Color(0xff212325);
final Color appGreen = Color(0xff00A86B);
final Color appRed = Color(0xffFD3C4A);
final Color appRedSoft = Color(0xffFDD5D7);
final Color appYellow = Color(0xffFCAC12);
final Color appYellowSoft = Color(0xffFCEED4);
final Color appWhite80 = Color(0xffFCFCFC);

final LinearGradient kuningLinear = LinearGradient(colors: [
  Color(0xffFFF6E5).withOpacity(0.9),
  Color(0xffF8EDD8).withOpacity(0.4),
], begin: Alignment.topCenter, end: Alignment.bottomCenter);
final LinearGradient violetlinear = LinearGradient(colors: [
  appVioletSoft.withOpacity(0.2),
  appViolet.withOpacity(0.3),
], begin: Alignment.topCenter, end: Alignment.bottomCenter);
