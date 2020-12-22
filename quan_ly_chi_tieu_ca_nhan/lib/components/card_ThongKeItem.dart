import 'package:flutter/material.dart';

class ThongKeItem extends StatelessWidget {
  final String textName;
  final String textNumber;
  final Color colorName;
  final Color colorNumber;

  ThongKeItem(
      {this.textName, this.textNumber, this.colorName, this.colorNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            textName,
            style: TextStyle(
              color: colorName,
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              fontFamily: 'Lobster',
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            textNumber,
            style: TextStyle(
              color: colorNumber,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lobster',
            ),
          )
        ],
      ),
    );
  }
}
