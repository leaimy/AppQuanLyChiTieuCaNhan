import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_tab.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/quan_ly_tien_tat_ca_tab.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tiet_kiem/quan_ly_muc_tieu_tiet_kiem_tat_ca_tab.dart';

class HomePage extends StatefulWidget {
  final NguoiDung nguoiDung;
  HomePage({this.nguoiDung});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    _children = [
      HomeTab(
        nguoiDung: widget.nguoiDung,
      ),
      QuanLyMucTieuTietKiemTatCaTab(
        nguoiDung: widget.nguoiDung,
      ),
      QuanLyTienTatCaTab(
        nguoiDung: widget.nguoiDung,
      ),
    ];

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[200],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey[700],
        elevation: 5.0,
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
