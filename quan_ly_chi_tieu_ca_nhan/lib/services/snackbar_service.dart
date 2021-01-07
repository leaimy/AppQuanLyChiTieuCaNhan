import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackBarSv {
  BuildContext _buildContext;

  static SnackBarSv instance = SnackBarSv();

  SnackBarSv() {}

  set buildContext(BuildContext _context) {
    _buildContext = _context;
  }

  void showSnackbarError(String _message) {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        duration: Duration(seconds: 1),
        content: Text(
          _message,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSnackbarSuccess(String _message) {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        duration: Duration(seconds: 1),
        content: Text(
          _message,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
