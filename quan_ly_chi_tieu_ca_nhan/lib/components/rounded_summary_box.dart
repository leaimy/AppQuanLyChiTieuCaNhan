import 'package:flutter/material.dart';

class RoundedSummaryBox extends StatelessWidget {
  final String title;
  final String money;
  final IconData icon;
  final Color titleColor;
  final Color moneyColor;
  final Color iconColor;
  final Color iconBgColor;
  final Color cardColor;

  RoundedSummaryBox({
    @required this.title,
    @required this.money,
    @required this.icon,
    this.titleColor = Colors.grey,
    this.moneyColor = Colors.black,
    this.iconColor = Colors.brown,
    this.iconBgColor = Colors.pinkAccent,
    this.cardColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.4;
    double iconBoxWidth = cardWidth * 0.5;
    double iconSize = iconBoxWidth * 0.5;

    return Material(
      elevation: 5.0,
      shadowColor: Colors.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: cardWidth,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Container(
              width: iconBoxWidth,
              height: iconBoxWidth,
              decoration: BoxDecoration(
                color: this.iconBgColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Icon(this.icon, size: iconSize, color: this.iconColor),
            ),
            SizedBox(height: 20.0),
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: this.titleColor,
                fontFamily: 'Lobster',
                letterSpacing: 1.1,
                fontSize: 13.0,
              ),
            ),
            SizedBox(height: 7.0),
            Text(
              this.money,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: this.moneyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
