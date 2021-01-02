import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/welcome_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.pink[200],
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
