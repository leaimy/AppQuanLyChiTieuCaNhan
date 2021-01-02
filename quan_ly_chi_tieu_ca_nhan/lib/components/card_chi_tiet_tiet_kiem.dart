import 'package:flutter/material.dart';

class CardChiTietTietKiem extends StatelessWidget {
  final double width;
  final double height;
  final String date;
  final String month;
  final Color color;
  final Color textColor;

  CardChiTietTietKiem({
    this.width = 150,
    this.height = 150,
    this.date,
    this.month,
    this.color = Colors.purple,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      margin: EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5.0,
        color: this.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.date,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 3.0),
            Text(
              this.month,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
