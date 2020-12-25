import 'dart:math';

import 'package:flutter/material.dart';

class CardAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rand = Random().nextInt(10);

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
                backgroundImage: AssetImage('images/avatar$rand.png'),
              ),
            ),
            SizedBox(width: 15.0),
            Flexible(
              child: Text(
                'Xin chào Heo con đáng yêu siêu dễ thương',
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
