import 'package:flutter/material.dart';

const gtpro = 'GtPro';
const helv = 'Helvetica';

class AppTextStyle {
  static const gt16black =
      TextStyle(fontFamily: gtpro, fontSize: 18, color: Colors.black);

  static const gt16blackbold = TextStyle(
      fontFamily: gtpro,
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static const gt16white =
      TextStyle(fontFamily: gtpro, fontSize: 16, color: Colors.white);

  static const gt16whitebold = TextStyle(
      fontFamily: gtpro,
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const helv16white =
      TextStyle(fontFamily: helv, fontSize: 18, color: Colors.white);
}
