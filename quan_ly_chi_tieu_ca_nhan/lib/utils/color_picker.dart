import 'dart:math';

import 'package:flutter/material.dart';

class ColorPicker {
  static List<Color> _colors = [
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.teal,
    Colors.purple,
  ];

  static Color random() {
    int rand = Random().nextInt(_colors.length);
    return _colors[rand];
  }
}
