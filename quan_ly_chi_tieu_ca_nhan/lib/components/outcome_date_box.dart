import 'package:flutter/material.dart';

class OutcomeDate extends StatelessWidget {
  final double width;
  final double height;
  final String date;
  final String month;
  final bool isSelected;
  final Function onPressed;

  OutcomeDate({
    this.width = 90,
    this.height = 100,
    this.date,
    this.month,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5.0,
          color: isSelected == true ? Colors.pink : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                month,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
