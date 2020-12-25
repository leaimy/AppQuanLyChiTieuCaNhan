import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/welcome_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
