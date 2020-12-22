import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/them_muc_tieu_screen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemMucTieuScreen(),
    );
  }
}
