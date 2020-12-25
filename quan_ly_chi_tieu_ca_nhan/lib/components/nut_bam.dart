import 'package:flutter/material.dart';

class NutBam extends StatelessWidget {
  final String textName;
  final Function onPressed;

  NutBam({@required this.textName, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textName,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: 'Lobster',
            ),
          ),
        ),
      ),
    );
  }
}
