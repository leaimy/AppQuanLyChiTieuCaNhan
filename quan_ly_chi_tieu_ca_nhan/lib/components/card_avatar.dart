import 'dart:math';

import 'package:flutter/material.dart';

class CardAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rand = Random().nextInt(10);

    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
              'Ha Nguyen Thi',
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
