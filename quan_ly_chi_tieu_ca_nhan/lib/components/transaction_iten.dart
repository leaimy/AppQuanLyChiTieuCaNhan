import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Color barColor;
  final Color iconColor;
  final IconData icon;
  final String amount;
  final String title;

  TransactionItem(
      {this.barColor, this.icon, this.iconColor, this.amount, this.title});

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
            height: 70.0,
            width: 7.0,
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(width: 10.0),
          Card(
            elevation: 5.0,
            child: Icon(
              this.icon,
              size: 50.0,
              color: this.iconColor,
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '-${this.amount} VND',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(this.title),
              ],
            ),
          )
        ],
      ),
    );
  }
}
