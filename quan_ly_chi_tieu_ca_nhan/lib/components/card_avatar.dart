import 'package:flutter/material.dart';

class CardAvatar extends StatelessWidget {
  final String tenHienThi;
  final String tenHinh;

  CardAvatar({this.tenHienThi, this.tenHinh});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/$tenHinh.png'),
              ),
            ),
            SizedBox(width: 15.0),
            Flexible(
              child: Text(
                'Xin chào $tenHienThi',
                style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
