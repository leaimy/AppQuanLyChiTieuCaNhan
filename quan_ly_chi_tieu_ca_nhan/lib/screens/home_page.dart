import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_tab.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/quan_ly_tien_tat_ca_tab.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tiet_kiem/quan_ly_muc_tieu_tiet_kiem_tat_ca_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    QuanLyMucTieuTietKiemTatCaTab(),
    QuanLyTienTatCaTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.piggyBank,
            ),
            label: 'Bỏ heo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.coins,
            ),
            label: 'Chi tiêu',
          ),
        ],
      ),
    );
  }
}
