import 'package:flutter/material.dart';

const gtpro = 'GtPro';
const helv = 'Helvetica';

class AppTextStyle {
  static const gt18black =
      TextStyle(fontFamily: gtpro, fontSize: 18, color: Colors.black);

  static const gt18blackbold = TextStyle(
      fontFamily: gtpro,
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static const gt18white =
      TextStyle(fontFamily: gtpro, fontSize: 18, color: Colors.white);

  static const gt18whitebold = TextStyle(
      fontFamily: gtpro,
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const helv18white =
      TextStyle(fontFamily: helv, fontSize: 18, color: Colors.white);
}
