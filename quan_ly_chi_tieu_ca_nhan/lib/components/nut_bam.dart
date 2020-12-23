import 'package:flutter/material.dart';

class NutBam extends StatelessWidget {
  final String textName;
  final Function onPressed;

  NutBam({@required this.textName, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.pink[200],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 10.0,
          ),
          child: Text(
            textName,
            style: TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Lobster',
            ),
          ),
        ),
      ),
    );
  }
}
