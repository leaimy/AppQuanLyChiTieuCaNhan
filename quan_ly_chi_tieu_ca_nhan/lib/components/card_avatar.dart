import 'dart:math';

import 'package:flutter/material.dart';

class CardAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rand = Random().nextInt(10);

    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/avatar$rand.png'),
              ),
            ),
            Text(
              'Xin chào Heo con',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Lobster',
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
