import 'dart:math';

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF355b99);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const secondaryColor = Color(0xFF6c757d);
const bgColor = Color(0xFF212332);
const double defaultPadding = 16.0;


double dynamicSize(s){
  Size size =MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;  ///MediaQuery.of(context).size
  double ds= sqrt((size.width * size.width) + (size.height * size.height));
  double fs = (s * ds * 0.001195);
  return double.parse(fs.toStringAsFixed(1));
}