import 'package:flutter/material.dart';

class CircleIconBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function onPressed;

  CircleIconBox({this.icon, this.color, this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.onPressed == null) return;
        onPressed();
      },
      child: Card(
        elevation: 2.5,
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: this.color,
            size: this.size,
          ),
        ),
      ),
    );
  }
}
