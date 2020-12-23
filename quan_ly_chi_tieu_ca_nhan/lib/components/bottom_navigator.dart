import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/thunhap_all_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/tietkiem_screen.dart';

class BottomNavigator extends StatelessWidget {
  final int selectedIndex;

  BottomNavigator({@required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    _onItemTapped(selectedIndex) {
      if (selectedIndex == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } else if (selectedIndex == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TietKiemScreen();
        }));
      } else if (selectedIndex == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return IncomeAllScreen();
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
