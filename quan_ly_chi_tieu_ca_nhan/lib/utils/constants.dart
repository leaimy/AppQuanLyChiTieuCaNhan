import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a text',
  hintStyle: TextStyle(fontFamily: 'Lobster'),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
  letterSpacing: 1.0,
  fontFamily: 'Lobster',
  color: Color(0xFFF48FB1),
);

const kPaddingMainPage = EdgeInsets.symmetric(
  vertical: 20.0,
  horizontal: 10.0,
);

const kURL = 'http://10.0.2.2:5000';
// const kURL = 'http://10.0.3.2:5000';
