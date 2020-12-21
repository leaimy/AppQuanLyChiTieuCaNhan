import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/lich_su_chi_tieu_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/them_chi_tieu_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/thunhap_all_screen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: OutcomeAllScreen(),
        ),
      ),
    );
  }
}
