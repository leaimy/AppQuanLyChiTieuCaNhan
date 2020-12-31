import 'dart:math';

import 'package:flutter/material.dart';

class ColorPicker {
  List<Color> _colors = [
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.teal,
    Colors.purple,
    Colors.pink[200],
    Colors.pink,
    Colors.purple[300],
    Colors.blueGrey,
    Colors.orange[300],
    Colors.red[200],
    Colors.redAccent[400]
  ];

  Color random() {
    int rand = Random().nextInt(_colors.length);
    return _colors[rand];
  }
}
