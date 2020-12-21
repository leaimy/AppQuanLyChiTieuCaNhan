import 'package:flutter/material.dart';

class MuctieuItem extends StatelessWidget {
  final Color barColor;
  final Color textColor;
  final Color iconColor;
  final String textName;
  final IconData icon;

  MuctieuItem(
      {this.barColor,
      this.textColor,
      this.iconColor,
      this.textName,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: TextStyle(fontSize: 18.0, color: textColor),
            ),
          ),
          Card(
            elevation: 5.0,
            child: Icon(
              icon,
              size: 50.0,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
