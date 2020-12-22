import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/them_muc_tieu_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/thunhap_all_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/thunhap_detail_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
