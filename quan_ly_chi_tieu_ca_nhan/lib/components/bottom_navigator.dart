import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/quan_ly_tien_tat_ca_tab.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tiet_kiem/quan_ly_muc_tieu_tiet_kiem_tat_ca_tab.dart';

class BottomNavigator extends StatelessWidget {
  final int selectedIndex;

  BottomNavigator({@required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    _onItemTapped(selectedIndex) {
      if (selectedIndex == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } else if (selectedIndex == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QuanLyMucTieuTietKiemTatCaTab();
        }));
      } else if (selectedIndex == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QuanLyTienTatCaTab();
        }));
      }
    }

    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.piggyBank,
            color: Colors.pinkAccent,
          ),
          label: 'Bỏ heo',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.coins,
            color: Colors.yellow,
          ),
          label: 'Chi tiêu',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      onTap: _onItemTapped,
    );
  }
}
