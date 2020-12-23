import 'package:flutter/material.dart';

class MuctieuItem extends StatelessWidget {
  final Color barColor;
  final Color textColor;
  final Color iconColor;
  final String textName;
  final IconData icon;
  final Function onItemPressed;

  MuctieuItem({
    this.barColor,
    this.textColor,
    this.iconColor,
    this.textName,
    this.icon,
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey),
            bottom: BorderSide(width: 0.5, color: Colors.grey),
            left: BorderSide(width: 0.5, color: Colors.grey),
            right: BorderSide(width: 0.5, color: Colors.grey),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              width: 7.0,
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                textName,
                style: TextStyle(
                  fontSize: 18.0,
                  color: textColor,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
            Material(
              elevation: 5.0,
              shape: CircleBorder(),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
