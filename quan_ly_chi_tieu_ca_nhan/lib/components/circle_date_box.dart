import 'package:flutter/material.dart';

class CircleDateBox extends StatelessWidget {
  final String text;
  final Color color;

  CircleDateBox({this.text, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shape: CircleBorder(),
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: this.color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
