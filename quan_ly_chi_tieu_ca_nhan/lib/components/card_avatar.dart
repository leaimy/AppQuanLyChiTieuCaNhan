import 'package:flutter/material.dart';

class CardAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                backgroundImage: NetworkImage(
                  "https://hoatuoivannam.com/wp-content/uploads/2019/02/hoa-hai-duong-dep-nhat-13.jpg",
                ),
              ),
            ),
            Text(
              'Ha Nguyen Thi',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
