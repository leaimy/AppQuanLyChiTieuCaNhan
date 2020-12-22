import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tiet_muc_tieu_tiet_kiem_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChiTietMucTieuTietKiemScreen(),
    );
  }
}
