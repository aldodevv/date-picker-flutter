import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsApp {
  static const Color bluepattern = Color(0xFF1B77C8);
  static const Color orangepattern = Color(0xFFFBAC5B);
  static const Color blueshape = Color(0xFF004C88);

  static const Color blue10 = Color(0xFFDDEFFC);
  static const Color blue20 = Color(0xFFDBEBF7);
  static const Color blue30 = Color(0xFF9ACEF7);
  static const Color blue50 = Color(0xFF56ADF2);
  static const Color blue60 = Color(0xFF2588D6);
  static const Color blue80 = Color(0xFF1078CA);
  static const Color blue90 = Color(0xFF0E69B1);
  static const Color blue100 = Color(0xFF00549B);

  static const Color green10 = Color(0xFFE1F8EB);
  static const Color green20 = Color(0xFFC2F1D6);
  static const Color green50 = Color(0xFF67DD99);
  static const Color green80 = Color(0xFF27AE60);

  static const Color yellow10 = Color(0xFFFFFEFA);
  static const Color yellow20 = Color(0xFFFCF2D2);
  static const Color yellow80 = Color(0xFFF2C94C);
  static const Color yellow90 = Color(0xFFEDB812);

  static const Color orange10 = Color(0xFFFEEDDF);
  static const Color orange20 = Color(0xFFFEDCC0);
  static const Color orange60 = Color(0xFFFC9641);
  static const Color orange70 = Color(0xFFFB8421);
  static const Color orange80 = Color(0xFFF87304);

  static const Color red10 = Color(0xFFFCE7E7);
  static const Color red20 = Color(0xFFF9CFCF);
  static const Color red50 = Color(0xFFF18888);
  static const Color red80 = Color(0xFFE84040);
  static const Color darkRed60 = Color(0xFF7B070B);


  static const Color dark10 = Color(0xFF666666);
  static const Color dark30 = Color(0xFF3D3D3D);
  static const Color dark40 = Color(0xFF292929);
  static const Color dark80 = Color(0xFF171717);


  static const Color light10 = Color(0xFFF8F9F9);
  static const Color light20 = Color(0xFFEAEBEB);
  static const Color light30 = Color(0xFFD3D4D4);
  static const Color light40 = Color(0xFFB5B6B6);
  static const Color light50 = Color(0xFFA3A3A3);
  static const Color light60 = Color(0xFF929393);
  static const Color light80 = Color(0xFF777777);

  static const Color darkGreen = Color(0xFF102F32);

  static const Color brown10 = Color(0xFFF1E0D0);
  static const Color brown50 = Color(0xFF9D693E);
  

  static const Color white = Color(0xFFFFFFFF);

  static Color withOpacity(Color color, {double opacity = 1}) {
    return color.withAlpha((255 * opacity).round());
  }
}
