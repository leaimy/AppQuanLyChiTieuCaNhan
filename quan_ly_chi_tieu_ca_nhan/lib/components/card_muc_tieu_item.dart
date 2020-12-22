import 'package:flutter/material.dart';

class CardMucTieuItem extends StatelessWidget {
  final String nameLable;
  final String nameText;
  final Color colorLable;
  final Color colorText;

  CardMucTieuItem(
      {this.nameLable, this.nameText, this.colorLable, this.colorText});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.0),
        Expanded(
          flex: 6,
          child: Text(
            nameLable,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 18.0,
              color: colorLable,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            nameText,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 18.0,
              color: colorText,
            ),
          ),
        )
      ],
    );
  }
}
