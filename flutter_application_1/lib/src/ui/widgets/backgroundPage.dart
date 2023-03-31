import 'package:flutter/material.dart';

class BackgroundPage {
  static BoxDecoration backgroundPageCreate() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/FondoFinal.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.color)));
  }
}
