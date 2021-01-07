import 'package:flutter/material.dart';

class CardChiTietTietKiem extends StatelessWidget {
  final String tieuDe;
  final String giaTri;
  final IconData icon;
  final Color tieuDeColor;
  final Color giaTriColor;
  final Color iconColor;
  final Color iconBgColor;
  final Color cardColor;

  CardChiTietTietKiem({
    @required this.tieuDe,
    @required this.giaTri,
    @required this.icon,
    this.tieuDeColor = Colors.grey,
    this.giaTriColor = Colors.black,
    this.iconColor = Colors.black,
    this.iconBgColor = Colors.pink,
    this.cardColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    bool isTooLong = giaTri.length > 100;

    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.5;
    double iconBoxWidth = cardWidth * 0.3;
    double iconSize = iconBoxWidth * 0.5;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
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
                this.tieuDe,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: this.tieuDeColor,
                  fontFamily: 'Lobster',
                  letterSpacing: 1.1,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                this.giaTri,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lobster',
                  color: this.giaTriColor,
                  fontSize: isTooLong ? 10.0 : 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
