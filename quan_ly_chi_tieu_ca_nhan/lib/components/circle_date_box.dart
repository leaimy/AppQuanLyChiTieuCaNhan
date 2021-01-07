import 'package:flutter/material.dart';

class CircleDateBox extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  CircleDateBox({this.text, this.color = Colors.white, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Material(
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
      ),
    );
  }
}
